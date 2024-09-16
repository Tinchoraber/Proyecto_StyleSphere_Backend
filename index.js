import express from "express";
import cors from "cors";
import tipoProductoRouter from "./src/controller/tipoProducto-controller.js";
import BuscadorRouter from './src/controller/buscador-controller.js'
import LocalesRouter from "./src/controller/locales-controller.js";
import ProductoRouter from './src/controller/producto-controller.js';
import ClienteRouter from './src/controller/cliente-controller.js';
import CarritoRouter from './src/controller/carrito-controller.js';
import FavoritoRouter from './src/controller/favorito-controller.js';
import PerfilRouter from './src/controller/perfil-controller.js';
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
app.use("/api/producto", ProductoRouter);
app.use("/api/cliente", ClienteRouter);
app.use("/api/carrito", CarritoRouter);
app.use("/api/favorito", FavoritoRouter);
app.use("/api/perfil", PerfilRouter);


//
// Inicio el Server y lo pongo a escuchar.
//
app.listen(port, () => {
console.log(`Example app listening on port ${port}`)
})