import * as THREE from 'three';
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader.js';

const MC_COLOR_VALUES = [
  16383998, 16351261, 13061821, 3847130,
  16701501, 8439583,  15961002, 4673362,
  10329495, 1481884,  8991416,  3949738,
  8606770,  6192150,  11546150, 1908001,
];

function toColor(decimal) {
  const c = new THREE.Color();
  c.setHex(decimal, THREE.SRGBColorSpace);
  return c;
}

const MC_COLORS = MC_COLOR_VALUES.map(toColor);

export const FISH_TYPES = [
  { name: 'Kob',       shape: 0, pattern: 0 },
  { name: 'Sunstreak', shape: 1, pattern: 0 },
  { name: 'Snooper',   shape: 0, pattern: 1 },
  { name: 'Dasher',    shape: 1, pattern: 1 },
  { name: 'Brinely',   shape: 0, pattern: 2 },
  { name: 'Spotty',    shape: 1, pattern: 2 },
  { name: 'Flopper',   shape: 0, pattern: 3 },
  { name: 'Stripey',   shape: 1, pattern: 3 },
  { name: 'Glitter',   shape: 0, pattern: 4 },
  { name: 'Blockfish', shape: 1, pattern: 4 },
  { name: 'Betty',     shape: 0, pattern: 5 },
  { name: 'Clayfish',  shape: 1, pattern: 5 },
];

export const COLOR_NAMES = [
  'White','Orange','Magenta','Light Blue','Yellow','Lime',
  'Pink','Gray','Light Gray','Cyan','Purple','Blue',
  'Brown','Green','Red','Black',
];

const RENDER_SIZE = 256;

class FishRendererSingleton {
  constructor() {
    this._renderCache = new Map();
    this._queue       = [];
    this._waiters     = new Map();
    this._running     = false;
    this._models      = null;
    this._textures    = null;
    this._assetsPromise = null;
    this._initGL();
  }

  _initGL() {
    const glCanvas = document.createElement('canvas');
    glCanvas.width = glCanvas.height = RENDER_SIZE;
    glCanvas.style.cssText = 'position:fixed;top:-9999px;left:-9999px;opacity:0;pointer-events:none;';
    document.body.appendChild(glCanvas);

    this._renderer = new THREE.WebGLRenderer({
      canvas: glCanvas,
      antialias: false,
      alpha: true,
      preserveDrawingBuffer: true,
    });
    this._renderer.setSize(RENDER_SIZE, RENDER_SIZE);
    this._renderer.setPixelRatio(1);
    this._renderer.outputColorSpace = THREE.SRGBColorSpace;
    this._renderer.autoClear = false; // ← render in due pass
    THREE.ColorManagement.enabled = true;

    this._canvas2d = document.createElement('canvas');
    this._canvas2d.width = this._canvas2d.height = RENDER_SIZE;
    this._ctx2d = this._canvas2d.getContext('2d');

    // Scena base (solo il corpo del pesce)
    this._sceneBase    = new THREE.Scene();
    this._sceneBase.add(new THREE.AmbientLight(0xFFFFFF, 3));

    // Scena pattern (sovrapposta senza depth test)
    this._scenePattern = new THREE.Scene();
    this._scenePattern.add(new THREE.AmbientLight(0xFFFFFF, 3));

    this._camera = new THREE.PerspectiveCamera(75, 1, 0.04, 1000);
    this._camera.position.set(1, 0.2, 0);
    this._camera.lookAt(new THREE.Vector3(0, 0.1, 0));
  }

  _loadAssets() {
    if (this._assetsPromise) return this._assetsPromise;

    this._assetsPromise = new Promise(async (resolve, reject) => {
      try {
        const loader = new GLTFLoader();
        const texLoader = new THREE.ImageBitmapLoader();

        const loadGLTF = (path) => new Promise((res, rej) =>
          loader.load(path, g => res(g.scene), undefined, rej)
        );

        const loadTex = (path) => new Promise((res, rej) =>
          texLoader.load(path, bitmap => {
            const tex = new THREE.CanvasTexture(bitmap);
            tex.colorSpace  = THREE.SRGBColorSpace;
            tex.magFilter   = THREE.NearestFilter;
            tex.minFilter   = THREE.NearestFilter;
            tex.needsUpdate = true;
            res(tex);
          }, undefined, rej)
        );

        const [base0, pat0, base1, pat1] = await Promise.all([
          loadGLTF('/fish/models/0/base.gltf'),
          loadGLTF('/fish/models/0/pattern.gltf'),
          loadGLTF('/fish/models/1/base.gltf'),
          loadGLTF('/fish/models/1/pattern.gltf'),
        ]);

        // Clona materiali per separare base e pattern
        [base0, base1].forEach(b =>
          b.traverse(n => { if (n.isMesh) n.material = n.material.clone(); })
        );
        [pat0, pat1].forEach(p =>
          p.traverse(n => {
            if (n.isMesh) {
              n.material = n.material.clone();
              // Pattern renderizzato senza depth test — sempre sopra
              n.material.depthTest  = false;
              n.material.depthWrite = false;
              n.material.transparent = true;
            }
          })
        );

        // Base e pattern in scene SEPARATE
        this._sceneBase.add(base0);
        this._sceneBase.add(base1);
        this._scenePattern.add(pat0);
        this._scenePattern.add(pat1);

        base0.visible = false; base1.visible = false;
        pat0.visible  = false; pat1.visible  = false;

        this._models = {
          0: { base: base0, pattern: pat0 },
          1: { base: base1, pattern: pat1 },
        };

        // Texture pattern
        const texPromises = [];
        for (let shape = 0; shape < 2; shape++)
          for (let p = 0; p < 6; p++)
            texPromises.push(
              loadTex(`/fish/textures/${shape}/pattern_${p}.png`)
                .then(tex => ({ key: `${shape}_${p}`, tex }))
            );

        const texResults = await Promise.all(texPromises);
        this._textures = new Map(texResults.map(r => [r.key, r.tex]));

        resolve();
      } catch (e) { reject(e); }
    });

    return this._assetsPromise;
  }

  async _runJob(job) {
    const { key, typeIndex, bodyColor, patternColor } = job;
    const ft    = FISH_TYPES[typeIndex];
    const shape = ft.shape;
    const other = shape === 0 ? 1 : 0;

    await this._loadAssets();

    const { base, pattern } = this._models[shape];

    // Nascondi l'altro shape
    this._models[other].base.visible    = false;
    this._models[other].pattern.visible = false;

    // Mostra shape corrente
    base.visible    = true;
    pattern.visible = true;

    // Colora base
    base.traverse(n => {
      if (n.isMesh) {
        n.material.color.copy(MC_COLORS[bodyColor]);
        n.material.needsUpdate = true;
      }
    });

    // Colora + texture pattern
    const patTex = this._textures.get(`${shape}_${ft.pattern}`);
    pattern.traverse(n => {
      if (n.isMesh) {
        n.material.map = patTex;
        n.material.color.copy(MC_COLORS[patternColor]);
        n.material.needsUpdate = true;
      }
    });

    // Render in DUE PASS:
    // 1) Pulisci e renderizza il base
    this._renderer.setClearColor(0x000000, 0);
    this._renderer.clear();
    this._renderer.render(this._sceneBase, this._camera);

    // 2) Renderizza il pattern sopra senza pulire (autoClear = false)
    this._renderer.render(this._scenePattern, this._camera);

    // Leggi il risultato
    this._ctx2d.clearRect(0, 0, RENDER_SIZE, RENDER_SIZE);
    this._ctx2d.drawImage(this._renderer.domElement, 0, 0);
    const url = this._canvas2d.toDataURL('image/png');


    return url;
  }

  async _pump() {
    if (this._running) return;
    this._running = true;
    while (this._queue.length > 0) {
      const job     = this._queue.shift();
      const waiters = this._waiters.get(job.key) || [];
      this._waiters.delete(job.key);
      try {
        const url = await this._runJob(job);
        this._renderCache.set(job.key, url);
        waiters.forEach(w => w.resolve(url));
      } catch (e) {

        waiters.forEach(w => w.reject(e));
      }
    }
    this._running = false;
  }

  render(typeIndex, bodyColor, patternColor) {
    const key = `${typeIndex}_${bodyColor}_${patternColor}`;
    if (this._renderCache.has(key)) return Promise.resolve(this._renderCache.get(key));
    return new Promise((resolve, reject) => {
      if (!this._waiters.has(key)) {
        this._waiters.set(key, []);
        this._queue.push({ key, typeIndex, bodyColor, patternColor });
      }
      this._waiters.get(key).push({ resolve, reject });
      this._pump();
    });
  }
}

let _inst = null;
export const getFishRenderer = () => {
  if (!_inst) _inst = new FishRendererSingleton();
  return _inst;
};