import express from "express";
import cors from "cors";
import tipoProductoRouter from "./src/controller/tipoProducto-controller.js";
import LocalesRouter from "./src/controller/locales-controller.js";
import BuscadorRouter from './src/controller/buscador-controller.js';
const app = express();
const port = 3001; 
// Agrego los Middlewares
app.use(cors()); // Middleware de CORS.
app.use(express.json()); // Middleware para parsear y comprender JSON.
//
// Endpoints (todos los Routers)
//
app.use("/api/tipoProducto", tipoProductoRouter);
app.use("/api/locales", LocalesRouter);
app.use("/api/buscador", BuscadorRouter);
//
// Inicio el Server y lo pongo a escuchar.
//
app.listen(port, () => {
console.log(`Example app listening on port ${port}`)
})