import { Router } from 'express';
import FavoritoService from '../service/favorito-service.js';
const router = Router();
const svc = new FavoritoService();

router.get('/:idCliente', async (req, res) => {
    const idCliente = req.params.idCliente;
    const returnArray = await svc.getFavorito(idCliente);
    res.status(returnArray[1]).json(returnArray[0]);

});

router.post('', async (req, res) => {
    const idProducto = req.body.idProducto;
    const idCliente = req.body.idCliente;
    const returnArray = await svc.insertFavoritoAsync(idProducto, idCliente);
    res.status(returnArray[1]).json(returnArray[0]);

});

router.delete('/:idFavorito', async (req, res) => {
    const idFavorito = req.params.idFavorito
    const returnArray = await svc.deleteFavorito(idFavorito);
    res.status(returnArray[1]).json(returnArray[0]);

});


export default router;