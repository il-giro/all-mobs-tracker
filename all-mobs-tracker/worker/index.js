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

      // Ottieni lo schema per la ricerca
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

      // Ottieni lo schema per validazione
      const schemaResult = await env.DB.prepare(
        `PRAGMA table_info(${tableName})`
      ).all();
      const columns = schemaResult.results.filter(col => col.name !== 'id' && col.pk !== 1);

      const columnNames = columns.map(col => col.name);
      const values = columnNames.map(name => body[name] ?? null);
      const placeholders = columnNames.map(() => '?').join(', ');

      const query = `INSERT INTO ${tableName} (${columnNames.join(', ')}) VALUES (${placeholders})`;

      const result = await env.DB.prepare(query).bind(...values).run();

      return Response.json({
        success: true,
        id: result.meta.last_row_id
      });
    } catch (error) {
      return Response.json(
        { success: false, error: error.message },
        { status: 500 }
      );
    }
  }

  // PUT /api/admin/data/:table/:id - Aggiorna un record
  if (path.match(/^\/api\/admin\/data\/[^\/]+\/\d+$/) && request.method === 'PUT') {
    const parts = path.split('/');
    const id = parts.pop();
    const tableName = parts.pop();

    if (!isAllowedTable(tableName)) {
      return Response.json(
        { success: false, error: 'Tabella non autorizzata' },
        { status: 403 }
      );
    }

    try {
      const body = await request.json();

      // Ottieni lo schema
      const schemaResult = await env.DB.prepare(
        `PRAGMA table_info(${tableName})`
      ).all();
      const columns = schemaResult.results.filter(col => col.name !== 'id' && col.pk !== 1);

      const setClauses = columns
        .filter(col => body.hasOwnProperty(col.name))
        .map(col => `${col.name} = ?`)
        .join(', ');

      const values = columns
        .filter(col => body.hasOwnProperty(col.name))
        .map(col => body[col.name]);

      const query = `UPDATE ${tableName} SET ${setClauses} WHERE id = ?`;

      await env.DB.prepare(query).bind(...values, id).run();

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
  if (path.match(/^\/api\/admin\/data\/[^\/]+\/\d+$/) && request.method === 'DELETE') {
    const parts = path.split('/');
    const id = parts.pop();
    const tableName = parts.pop();

    if (!isAllowedTable(tableName)) {
      return Response.json(
        { success: false, error: 'Tabella non autorizzata' },
        { status: 403 }
      );
    }

    try {
      const query = `DELETE FROM ${tableName} WHERE id = ?`;
      await env.DB.prepare(query).bind(id).run();

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
