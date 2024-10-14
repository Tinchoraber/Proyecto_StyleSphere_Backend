import { Router } from 'express';
import ReseniaService from '../service/resenia-service.js';
import jwt from 'jsonwebtoken';
const router = Router();
const svc = new ReseniaService();

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
            req.user = user; // Asignar el usuario completo al req.user
            next();
        });
    } else {
        res.status(403).json({ message: 'Token requerido' });
    }
};


router.get('/:idTienda', async (req, res) => {
    const idTienda = req.params.idTienda
    const returnArray = await svc.getReseniasFromTienda(idTienda);
    res.status(returnArray[1]).json(returnArray[0]);

});

router.post('/agregar', verifyToken, async (req, res) => {
    const idCliente = req.user.idCliente; 
    const idTienda = req.body.idTienda
    const resenia = req.body
    const returnArray = await svc.agregarResenia(idCliente, idTienda, resenia);
    res.status(returnArray[1]).json(returnArray[0]);

});

router.put('/actualizar', verifyToken, async (req, res) => {
    const idCliente = req.user.idCliente; 
    const idTienda = req.body.idTienda;
    const reseniaNueva = req.body;
    const returnArray = await svc.actualizarResenia(idCliente, idTienda, reseniaNueva);
    res.status(returnArray[1]).json(returnArray[0]);

});

router.delete('/borrar/:idResenia', async (req, res) => {
    const idResenia = req.params.idResenia; 
    console.log('el id del controller es',idResenia)
    const returnArray = await svc.borrarResenia(idResenia);
    res.status(returnArray[1]).json(returnArray[0]);

});

export default router;