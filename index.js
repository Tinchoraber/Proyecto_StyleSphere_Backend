import express from "express";
import cors from "cors";
import tipoProductoRouter from "./src/controller/tipoProducto-controller.js";
const app = express();
const port = 3001; 
// Agrego los Middlewares
app.use(cors()); // Middleware de CORS.
app.use(express.json()); // Middleware para parsear y comprender JSON.
//
// Endpoints (todos los Routers)
//
app.use("/api/tipoProducto", tipoProductoRouter);
//
// Inicio el Server y lo pongo a escuchar.
//
app.listen(port, () => {
console.log(`Example app listening on port ${port}`)
})