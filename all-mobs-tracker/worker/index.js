
export default {
  async fetch(request, env) {
    const url = new URL(request.url);

    // API di prova: restituisce le tabelle del database.
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

    // Tutte le altre richieste vengono gestite dagli asset statici.
    return env.ASSETS.fetch(request);
  }
};
