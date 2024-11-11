import { Router } from 'express';
import jwt from 'jsonwebtoken';
import PedidoService from '../service/pedido-service.js';

const router = Router();
const svc = new PedidoService();

const verifyToken = (req, res, next) => {
    const bearerHeader = req.headers['authorization'];
    const secretKey = process.env.ACCESS_TOKEN_SECRET || 'ClaveSuperSecreta2006$';

    if (typeof bearerHeader !== 'undefined') {
        const bearer = bearerHeader.split(' ');
        const token = bearer[1];

        jwt.verify(token, secretKey, (err, user) => {
            if (err) {
                return res.status(401).json({ message: 'Token inválido' });
            }
            req.user = user;
            next();
        });
    } else {
        res.status(403).json({ message: 'Token requerido' });
    }
};


router.get('', verifyToken, async (req, res) => {
    const idCliente = req.user.idCliente; 
    const returnArray = await svc.getAllTarjetasFromClienteAsync(idCliente);
    res.status(returnArray[1]).json(returnArray[0]);
});

router.post('/agregar', verifyToken, async (req, res) => {
    const idCliente = req.user.idCliente;
    const tarjeta = req.body
    const returnArray = await svc.crearPedido(idCliente, tarjeta);
    res.status(returnArray[1]).json(returnArray[0]);
});



export default router;