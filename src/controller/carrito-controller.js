import { Router } from 'express';
import CarritoService from '../service/carrito-service.js';
const router = Router();
const svc = new CarritoService();

router.post('', async (req, res) => {
    const idProducto = req.body.idProducto;
    const idCliente = req.body.idCliente;
    const returnArray = await svc.insertCarritoAsync(idProducto, idCliente);
    res.status(returnArray[1]).json(returnArray[0]);

});

export default router;