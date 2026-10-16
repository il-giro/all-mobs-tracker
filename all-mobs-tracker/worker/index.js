// Tabelle ammesse per le operazioni amministrative
const ALLOWED_TABLES = ['MOBS', 'VARIANTS', 'CATEGORIES', 'MOB_CATEGORIES', 'VARIANT_CATEGORIES'];

// Verifica se una tabella è ammessa
function isAllowedTable(tableName) {
  return ALLOWED_TABLES.includes(tableName);
}

// Gestisce le richieste API amministrative
async function handleAdminAPI(request, env) {
  const url = new URL(request.url);
  const path = url.pathname;

  // GET /api/admin/tables - Lista le tabelle gestibili
  if (path === '/api/admin/tables' && request.method === 'GET') {
    try {
      const result = await env.DB.prepare(
        "SELECT name FROM sqlite_master WHERE type = 'table' AND name NOT LIKE '_cf%' ORDER BY name"
      ).all();

      const tables = result.results.map(r => r.name).filter(name => isAllowedTable(name));

      return Response.json({
        success: true,
        tables: tables
      });
    } catch (error) {
      return Response.json(
        { success: false, error: error.message },
        { status: 500 }
      );
    }
  }

  // GET /api/admin/schema/:table - Ottiene lo schema di una tabella
  if (path.match(/^\/api\/admin\/schema\/[^\/]+$/) && request.method === 'GET') {
    const tableName = path.split('/').pop();

    if (!isAllowedTable(tableName)) {
      return Response.json(
        { success: false, error: 'Tabella non autorizzata' },
        { status: 403 }
      );
    }

    try {
      const schemaResult = await env.DB.prepare(
        `PRAGMA table_info(${tableName})`
      ).all();

      return Response.json({
        success: true,
        table: tableName,
        columns: schemaResult.results
      });
    } catch (error) {
      return Response.json(
        { success: false, error: error.message },
        { status: 500 }
      );
    }
  }

  // GET /api/admin/data/:table - Ottiene i dati di una tabella con paginazione
  if (path.match(/^\/api\/admin\/data\/[^\/]+$/) && request.method === 'GET') {
    const tableName = path.split('/').pop();

    if (!isAllowedTable(tableName)) {
      return Response.json(
        { success: false, error: 'Tabella non autorizzata' },
        { status: 403 }
      );
    }

    try {
      const page = parseInt(url.searchParams.get('page') || '1');
      const limit = Math.min(parseInt(url.searchParams.get('limit') || '50'), 100);
      const search = url.searchParams.get('search') || '';
      const orderBy = url.searchParams.get('orderBy') || '';
      const orderDir = url.searchParams.get('orderDir') === 'desc' ? 'DESC' : 'ASC';

      const offset = (page - 1) * limit;

      // Query speciali con JOIN per le tabelle di relazione (ricerca per nome)
      if (tableName === 'MOB_CATEGORIES') {
        const searchClause = search
          ? `WHERE (m.name LIKE ? OR c.name LIKE ?)`
          : '';
        const searchParams = search ? [`%${search}%`, `%${search}%`] : [];

        let orderClause = 'ORDER BY m.name ASC, c.name ASC';
        if (orderBy === 'mob_id') orderClause = `ORDER BY m.name ${orderDir}`;
        else if (orderBy === 'category_id') orderClause = `ORDER BY c.name ${orderDir}`;

        const dataQuery = `
          SELECT mc.mob_id, mc.category_id,
                 m.name as mob_name_sort, c.name as cat_name_sort
          FROM MOB_CATEGORIES mc
          JOIN MOBS m ON mc.mob_id = m.id
          JOIN CATEGORIES c ON mc.category_id = c.id
          ${searchClause}
          ${orderClause}
          LIMIT ? OFFSET ?`;
        const countQuery = `
          SELECT COUNT(*) as total
          FROM MOB_CATEGORIES mc
          JOIN MOBS m ON mc.mob_id = m.id
          JOIN CATEGORIES c ON mc.category_id = c.id
          ${searchClause}`;

        const [dataResult, countResult] = await Promise.all([
          env.DB.prepare(dataQuery).bind(...searchParams, limit, offset).all(),
          env.DB.prepare(countQuery).bind(...searchParams).all()
        ]);

        const total = countResult.results[0]?.total || 0;
        // Rimuovi le colonne di ordinamento interne dalla risposta
        const data = dataResult.results.map(({ mob_name_sort, cat_name_sort, ...r }) => r);

        return Response.json({
          success: true,
          data,
          pagination: { page, limit, total, totalPages: Math.ceil(total / limit) }
        });
      }

      if (tableName === 'VARIANT_CATEGORIES') {
        const searchClause = search
          ? `WHERE (v.name LIKE ? OR c.name LIKE ?)`
          : '';
        const searchParams = search ? [`%${search}%`, `%${search}%`] : [];

        let orderClause = 'ORDER BY v.name ASC, c.name ASC';
        if (orderBy === 'variant_id') orderClause = `ORDER BY v.name ${orderDir}`;
        else if (orderBy === 'category_id') orderClause = `ORDER BY c.name ${orderDir}`;

        const dataQuery = `
          SELECT vc.variant_id, vc.category_id,
                 v.name as var_name_sort, c.name as cat_name_sort
          FROM VARIANT_CATEGORIES vc
          JOIN VARIANTS v ON vc.variant_id = v.id
          JOIN CATEGORIES c ON vc.category_id = c.id
          ${searchClause}
          ${orderClause}
          LIMIT ? OFFSET ?`;
        const countQuery = `
          SELECT COUNT(*) as total
          FROM VARIANT_CATEGORIES vc
          JOIN VARIANTS v ON vc.variant_id = v.id
          JOIN CATEGORIES c ON vc.category_id = c.id
          ${searchClause}`;

        const [dataResult, countResult] = await Promise.all([
          env.DB.prepare(dataQuery).bind(...searchParams, limit, offset).all(),
          env.DB.prepare(countQuery).bind(...searchParams).all()
        ]);

        const total = countResult.results[0]?.total || 0;
        const data = dataResult.results.map(({ var_name_sort, cat_name_sort, ...r }) => r);

        return Response.json({
          success: true,
          data,
          pagination: { page, limit, total, totalPages: Math.ceil(total / limit) }
        });
      }

      // Tabelle standard (MOBS, VARIANTS, CATEGORIES)
      const schemaResult = await env.DB.prepare(
        `PRAGMA table_info(${tableName})`
      ).all();
      const columns = schemaResult.results;

      // Query per i dati
      let query = `SELECT * FROM ${tableName}`;
      let countQuery = `SELECT COUNT(*) as total FROM ${tableName}`;
      const params = [];

      // Aggiungi ricerca se specificata
      if (search) {
        const textColumns = columns.filter(col => col.type === 'TEXT' || col.type === 'VARCHAR');

        if (textColumns.length > 0) {
          const whereClauses = textColumns
            .map(col => `${col.name} LIKE ?`)
            .join(' OR ');

          query += ` WHERE ${whereClauses}`;
          countQuery += ` WHERE ${whereClauses}`;

          textColumns.forEach(() => params.push(`%${search}%`));
        }
      }

      // Aggiungi ordinamento
      if (orderBy && columns.some(col => col.name === orderBy)) {
        query += ` ORDER BY ${orderBy} ${orderDir}`;
      }

      // Aggiungi paginazione
      query += ` LIMIT ? OFFSET ?`;

      // Esegui le query
      const [dataResult, countResult] = await Promise.all([
        env.DB.prepare(query).bind(...params, limit, offset).all(),
        env.DB.prepare(countQuery).bind(...params).all()
      ]);

      const total = countResult.results[0]?.total || 0;

      return Response.json({
        success: true,
        data: dataResult.results,
        pagination: {
          page,
          limit,
          total,
          totalPages: Math.ceil(total / limit)
        }
      });
    } catch (error) {
      return Response.json(
        { success: false, error: error.message },
        { status: 500 }
      );
    }
  }

  // POST /api/admin/data/:table/bulk-delete - Eliminazione di massa
  if (path.match(/^\/api\/admin\/data\/[^\/]+\/bulk-delete$/) && request.method === 'POST') {
    const parts = path.split('/');
    parts.pop(); // 'bulk-delete'
    const tableName = parts.pop();

    if (!isAllowedTable(tableName)) {
      return Response.json(
        { success: false, error: 'Tabella non autorizzata' },
        { status: 403 }
      );
    }

    try {
      const { ids } = await request.json();
      if (!Array.isArray(ids) || ids.length === 0) {
        return Response.json(
          { success: false, error: 'Nessun ID fornito per l\'eliminazione' },
          { status: 400 }
        );
      }

      let statements = [];

      if (tableName === 'MOB_CATEGORIES') {
        const query = `DELETE FROM MOB_CATEGORIES WHERE mob_id = ? AND category_id = ?`;
        statements = ids.map(compositeId => {
          const [mobId, categoryId] = String(compositeId).split('_');
          return env.DB.prepare(query).bind(mobId, categoryId);
        });
      } else if (tableName === 'VARIANT_CATEGORIES') {
        const query = `DELETE FROM VARIANT_CATEGORIES WHERE variant_id = ? AND category_id = ?`;
        statements = ids.map(compositeId => {
          const [variantId, categoryId] = String(compositeId).split('_');
          return env.DB.prepare(query).bind(variantId, categoryId);
        });
      } else {
        const query = `DELETE FROM ${tableName} WHERE id = ?`;
        statements = ids.map(id => env.DB.prepare(query).bind(id));
      }

      await env.DB.batch(statements);

      return Response.json({
        success: true,
        deletedCount: ids.length
      });
    } catch (error) {
      return Response.json(
        { success: false, error: error.message },
        { status: 500 }
      );
    }
  }

  // POST /api/admin/data/:table/bulk-assign-category - Assegnazione categoria multipla
  if (path.match(/^\/api\/admin\/data\/[^\/]+\/bulk-assign-category$/) && request.method === 'POST') {
    const parts = path.split('/');
    parts.pop(); // 'bulk-assign-category'
    const tableName = parts.pop();

    if (tableName !== 'MOBS' && tableName !== 'VARIANTS') {
      return Response.json(
        { success: false, error: 'Assegnazione categoria consentita solo per MOBS o VARIANTS' },
        { status: 400 }
      );
    }

    try {
      const { targetIds, categoryId } = await request.json();
      if (!Array.isArray(targetIds) || targetIds.length === 0 || !categoryId) {
        return Response.json(
          { success: false, error: 'targetIds o categoryId mancanti' },
          { status: 400 }
        );
      }

      let statements = [];
      if (tableName === 'MOBS') {
        const query = `INSERT OR IGNORE INTO MOB_CATEGORIES (mob_id, category_id) VALUES (?, ?)`;
        statements = targetIds.map(mobId => env.DB.prepare(query).bind(mobId, categoryId));
      } else {
        const query = `INSERT OR IGNORE INTO VARIANT_CATEGORIES (variant_id, category_id) VALUES (?, ?)`;
        statements = targetIds.map(varId => env.DB.prepare(query).bind(varId, categoryId));
      }

      await env.DB.batch(statements);

      return Response.json({
        success: true,
        count: targetIds.length
      });
    } catch (error) {
      return Response.json(
        { success: false, error: error.message },
        { status: 500 }
      );
    }
  }

  // POST /api/admin/data/:table - Crea un nuovo record
  if (path.match(/^\/api\/admin\/data\/[^\/]+$/) && request.method === 'POST') {
    const tableName = path.split('/').pop();

    if (!isAllowedTable(tableName)) {
      return Response.json(
        { success: false, error: 'Tabella non autorizzata' },
        { status: 403 }
      );
    }

    try {
      const body = await request.json();

      // Ottieni lo schema per validazione (esclude solo 'id' autoincrementante)
      const schemaResult = await env.DB.prepare(
        `PRAGMA table_info(${tableName})`
      ).all();
      const columns = schemaResult.results.filter(col => col.name !== 'id');

      const columnNames = columns.map(col => col.name);
      const values = columnNames.map(name => body[name] ?? null);
      const placeholders = columnNames.map(() => '?').join(', ');

      const isRelationTable = tableName === 'MOB_CATEGORIES' || tableName === 'VARIANT_CATEGORIES';
      const insertVerb = isRelationTable ? 'INSERT OR IGNORE INTO' : 'INSERT INTO';
      const query = `${insertVerb} ${tableName} (${columnNames.join(', ')}) VALUES (${placeholders})`;

      const result = await env.DB.prepare(query).bind(...values).run();

      return Response.json({
        success: true,
        id: result.meta?.last_row_id || null
      });
    } catch (error) {
      return Response.json(
        { success: false, error: error.message },
        { status: 500 }
      );
    }
  }

  // PUT /api/admin/data/:table/:id - Aggiorna un record
  if (path.match(/^\/api\/admin\/data\/[^\/]+\/[^\/]+$/) && request.method === 'PUT') {
    const parts = path.split('/');
    const rawId = parts.pop();
    const tableName = parts.pop();

    if (!isAllowedTable(tableName)) {
      return Response.json(
        { success: false, error: 'Tabella non autorizzata' },
        { status: 403 }
      );
    }

    try {
      const body = await request.json();

      if (tableName === 'MOB_CATEGORIES') {
        const [oldMobId, oldCatId] = rawId.split('_');
        const query = `UPDATE MOB_CATEGORIES SET mob_id = ?, category_id = ? WHERE mob_id = ? AND category_id = ?`;
        await env.DB.prepare(query).bind(body.mob_id, body.category_id, oldMobId, oldCatId).run();
      } else if (tableName === 'VARIANT_CATEGORIES') {
        const [oldVarId, oldCatId] = rawId.split('_');
        const query = `UPDATE VARIANT_CATEGORIES SET variant_id = ?, category_id = ? WHERE variant_id = ? AND category_id = ?`;
        await env.DB.prepare(query).bind(body.variant_id, body.category_id, oldVarId, oldCatId).run();
      } else {
        const schemaResult = await env.DB.prepare(
          `PRAGMA table_info(${tableName})`
        ).all();
        const columns = schemaResult.results.filter(col => col.name !== 'id');

        const setClauses = columns
          .filter(col => body.hasOwnProperty(col.name))
          .map(col => `${col.name} = ?`)
          .join(', ');

        const values = columns
          .filter(col => body.hasOwnProperty(col.name))
          .map(col => body[col.name]);

        const query = `UPDATE ${tableName} SET ${setClauses} WHERE id = ?`;
        await env.DB.prepare(query).bind(...values, rawId).run();
      }

      return Response.json({
        success: true
      });
    } catch (error) {
      return Response.json(
        { success: false, error: error.message },
        { status: 500 }
      );
    }
  }

  // DELETE /api/admin/data/:table/:id - Elimina un record
  // Supporta sia id semplice (MOBS, VARIANTS, CATEGORIES) sia chiavi composite
  // (MOB_CATEGORIES: "mobId_catId", VARIANT_CATEGORIES: "varId_catId")
  if (path.match(/^\/api\/admin\/data\/[^\/]+\/[^\/]+$/) && request.method === 'DELETE') {
    const parts = path.split('/');
    const rawId = parts.pop();
    const tableName = parts.pop();

    if (!isAllowedTable(tableName)) {
      return Response.json(
        { success: false, error: 'Tabella non autorizzata' },
        { status: 403 }
      );
    }

    try {
      let query;
      let bindParams;

      if (tableName === 'MOB_CATEGORIES') {
        const [mobId, categoryId] = rawId.split('_');
        if (!mobId || !categoryId) {
          return Response.json({ success: false, error: 'ID composito non valido per MOB_CATEGORIES' }, { status: 400 });
        }
        query = `DELETE FROM MOB_CATEGORIES WHERE mob_id = ? AND category_id = ?`;
        bindParams = [mobId, categoryId];
      } else if (tableName === 'VARIANT_CATEGORIES') {
        const [variantId, categoryId] = rawId.split('_');
        if (!variantId || !categoryId) {
          return Response.json({ success: false, error: 'ID composito non valido per VARIANT_CATEGORIES' }, { status: 400 });
        }
        query = `DELETE FROM VARIANT_CATEGORIES WHERE variant_id = ? AND category_id = ?`;
        bindParams = [variantId, categoryId];
      } else {
        query = `DELETE FROM ${tableName} WHERE id = ?`;
        bindParams = [rawId];
      }

      await env.DB.prepare(query).bind(...bindParams).run();

      return Response.json({
        success: true
      });
    } catch (error) {
      return Response.json(
        { success: false, error: error.message },
        { status: 500 }
      );
    }
  }

  // GET /api/admin/stats - Ottiene le statistiche della dashboard
  if (path === '/api/admin/stats' && request.method === 'GET') {
    try {
      const [mobsCount, variantsCount, categoriesCount, mobCategoriesCount, variantCategoriesCount] = await Promise.all([
        env.DB.prepare('SELECT COUNT(*) as count FROM MOBS').all(),
        env.DB.prepare('SELECT COUNT(*) as count FROM VARIANTS').all(),
        env.DB.prepare('SELECT COUNT(*) as count FROM CATEGORIES').all(),
        env.DB.prepare('SELECT COUNT(*) as count FROM MOB_CATEGORIES').all(),
        env.DB.prepare('SELECT COUNT(*) as count FROM VARIANT_CATEGORIES').all()
      ]);

      return Response.json({
        success: true,
        stats: {
          mobs: mobsCount.results[0]?.count || 0,
          variants: variantsCount.results[0]?.count || 0,
          categories: categoriesCount.results[0]?.count || 0,
          mobCategories: mobCategoriesCount.results[0]?.count || 0,
          variantCategories: variantCategoriesCount.results[0]?.count || 0
        }
      });
    } catch (error) {
      return Response.json(
        { success: false, error: error.message },
        { status: 500 }
      );
    }
  }

  return Response.json(
    { success: false, error: 'Endpoint non trovato' },
    { status: 404 }
  );
}

export default {
  async fetch(request, env) {
    const url = new URL(request.url);

    // Routing per la dashboard admin
    if (url.pathname === '/admin' || url.pathname === '/admin/') {
      // Redirect alla pagina admin.html
      return env.ASSETS.fetch(new Request(new URL('/admin.html', url.origin), request));
    }

    // API amministrative
    if (url.pathname.startsWith('/api/admin/')) {
      return handleAdminAPI(request, env);
    }

    // CORS preflight per le API
    if (request.method === 'OPTIONS' && url.pathname.startsWith('/api/')) {
      return new Response(null, {
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Content-Type, Authorization',
        }
      });
    }

    // API pubblica: ottiene tutti i dati del tracker (categorie, mob, varianti e relazioni)
    if (url.pathname === '/api/tracker-data' && request.method === 'GET') {
      try {
        const [categoriesRes, mobsRes, variantsRes] = await Promise.all([
          env.DB.prepare('SELECT id, name, icon, color, link, description, priority, variant, special FROM CATEGORIES ORDER BY priority ASC, id ASC').all(),
          env.DB.prepare(`
            SELECT m.id, m.name, m.img, m.link, m.description,
                   GROUP_CONCAT(mc.category_id) as category_ids
            FROM MOBS m
            LEFT JOIN MOB_CATEGORIES mc ON m.id = mc.mob_id
            GROUP BY m.id
            ORDER BY m.id ASC
          `).all(),
          env.DB.prepare(`
            SELECT v.id, v.name, v.img, v.link, v.description, v.mob_id,
                   GROUP_CONCAT(vc.category_id) as category_ids
            FROM VARIANTS v
            LEFT JOIN VARIANT_CATEGORIES vc ON v.id = vc.variant_id
            GROUP BY v.id
            ORDER BY v.id ASC
          `).all()
        ]);

        const categories = (categoriesRes.results || []).map(c => ({
          ...c,
          slug: c.name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '')
        }));

        const mobs = (mobsRes.results || []).map(m => ({
          ...m,
          category_ids: m.category_ids ? m.category_ids.split(',').map(Number) : []
        }));

        const variants = (variantsRes.results || []).map(v => ({
          ...v,
          category_ids: v.category_ids ? v.category_ids.split(',').map(Number) : []
        }));

        const cacheControl = url.searchParams.get('bust')
          ? 'no-cache, no-store, must-revalidate'
          : 'public, max-age=3600, s-maxage=86400, stale-while-revalidate=86400';

        return Response.json({
          success: true,
          categories,
          mobs,
          variants
        }, {
          headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
            'Cache-Control': cacheControl
          }
        });
      } catch (error) {
        return Response.json(
          { success: false, error: error.message },
          { status: 500, headers: { 'Access-Control-Allow-Origin': '*' } }
        );
      }
    }

    // API pubblica: lista categorie
    if (url.pathname === '/api/categories' && request.method === 'GET') {
      try {
        const result = await env.DB.prepare('SELECT id, name, icon, color, link, description, priority, variant, special FROM CATEGORIES ORDER BY priority ASC, id ASC').all();
        const categories = (result.results || []).map(c => ({
          ...c,
          slug: c.name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '')
        }));
        return Response.json({ success: true, categories }, {
          headers: { 'Access-Control-Allow-Origin': '*', 'Cache-Control': 'no-cache' }
        });
      } catch (error) {
        return Response.json({ success: false, error: error.message }, { status: 500 });
      }
    }

    // API pubblica: lista mob base
    if (url.pathname === '/api/mobs' && request.method === 'GET') {
      try {
        const result = await env.DB.prepare(`
          SELECT m.id, m.name, m.img, m.link, m.description,
                 GROUP_CONCAT(mc.category_id) as category_ids
          FROM MOBS m
          LEFT JOIN MOB_CATEGORIES mc ON m.id = mc.mob_id
          GROUP BY m.id
          ORDER BY m.id ASC
        `).all();
        const mobs = (result.results || []).map(m => ({
          ...m,
          category_ids: m.category_ids ? m.category_ids.split(',').map(Number) : []
        }));
        return Response.json({ success: true, mobs }, {
          headers: { 'Access-Control-Allow-Origin': '*', 'Cache-Control': 'no-cache' }
        });
      } catch (error) {
        return Response.json({ success: false, error: error.message }, { status: 500 });
      }
    }

    // API pubblica: lista varianti
    if (url.pathname === '/api/variants' && request.method === 'GET') {
      try {
        const result = await env.DB.prepare(`
          SELECT v.id, v.name, v.img, v.link, v.description, v.mob_id,
                 GROUP_CONCAT(vc.category_id) as category_ids
          FROM VARIANTS v
          LEFT JOIN VARIANT_CATEGORIES vc ON v.id = vc.variant_id
          GROUP BY v.id
          ORDER BY v.id ASC
        `).all();
        const variants = (result.results || []).map(v => ({
          ...v,
          category_ids: v.category_ids ? v.category_ids.split(',').map(Number) : []
        }));
        return Response.json({ success: true, variants }, {
          headers: { 'Access-Control-Allow-Origin': '*', 'Cache-Control': 'no-cache' }
        });
      } catch (error) {
        return Response.json({ success: false, error: error.message }, { status: 500 });
      }
    }

    // API di prova: restituisce le tabelle del database
    if (url.pathname === "/api/db-test" && request.method === "GET") {
      try {
        const result = await env.DB.prepare(
          "SELECT name FROM sqlite_master WHERE type = 'table' ORDER BY name"
        ).all();

        return Response.json({
          success: true,
          tables: result.results
        });
      } catch (error) {
        return Response.json(
          { success: false, error: "Errore nella lettura del database" },
          { status: 500 }
        );
      }
    }

    // Tutte le altre richieste vengono gestite dagli asset statici
    return env.ASSETS.fetch(request);
  }
};
