import { Router } from 'express';
import CarritoService from '../service/carrito-service.js';
import jwt from 'jsonwebtoken';
const router = Router();
const svc = new CarritoService();
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
router.get('/', verifyToken, async (req, res) => {
    const idCliente = req.user.idCliente;  
    const returnArray = await svc.selectCarritoAsync(idCliente);
    res.status(returnArray[1]).json(returnArray[0]);

});
router.post('', verifyToken, async (req, res) => {
    const idProducto = req.body.idProducto;
    const cantidad = req.body.cantidad;
    const idCliente = req.user.idCliente;
    const returnArray = await svc.insertCarritoAsync(idProducto, idCliente, cantidad);
    res.status(returnArray[1]).json(returnArray[0]);

});

router.put('/:idProducto', verifyToken, async (req, res) => {
    const idProducto = req.params.idProducto;
    const idCliente = req.user.idCliente; 
    const cantidad = req.body.cantidad;
    const returnArray = await svc.updateCarritoAsync(idProducto, idCliente, cantidad);
    res.status(returnArray[1]).json(returnArray[0]);
});


export default router;