import { Router } from 'express';
import FavoritoService from '../service/favorito-service.js';
const router = Router();
const svc = new FavoritoService();

router.post('', async (req, res) => {
    const idProducto = req.body.idProducto;
    const idCliente = req.body.idCliente;
    const returnArray = await svc.insertFavoritoAsync(idProducto, idCliente);
    res.status(returnArray[1]).json(returnArray[0]);

});

export default router;