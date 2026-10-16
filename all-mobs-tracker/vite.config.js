import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { resolve } from 'path'

export default defineConfig({
  plugins: [react()],
  build: {
    rollupOptions: {
      input: {
        main: resolve(__dirname, 'index.html'),
        admin: resolve(__dirname, 'admin.html')
      },
      output: {
        manualChunks(id) {
          if (id.includes('node_modules/three')) return 'three';
          if (id.includes('node_modules/react-dom')) return 'react-dom';
          if (id.includes('node_modules/react-router-dom') || id.includes('node_modules/react-router')) return 'router';
        }
      }
    }
  },
  server: {
    fs: {
      strict: false
    },
    proxy: {
      '/api': {
        target: 'https://allmobs.riccardogir07.workers.dev',
        changeOrigin: true
      }
    }
  }
})
