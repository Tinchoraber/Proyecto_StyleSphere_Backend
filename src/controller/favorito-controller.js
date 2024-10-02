import { Router } from 'express';
import FavoritoService from '../service/favorito-service.js';
import jwt from 'jsonwebtoken';

const router = Router();
const svc = new FavoritoService();

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
    try {
        const idCliente = req.user.idCliente;  
        const returnArray = await svc.getFavorito(idCliente);
        res.status(returnArray[1]).json(returnArray[0]);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Error en el servidor' });
    }
});

router.post('', verifyToken, async (req, res) => {
    const idCliente = req.user.idCliente; 
    console.log("ID Cliente:", idCliente);  
    const idProducto = req.body.idProducto;
    const returnArray = await svc.insertFavoritoAsync(idProducto, idCliente);
    res.status(returnArray[1]).json(returnArray[0]);

});

router.delete('/:idFavorito', async (req, res) => {
    const idFavorito = req.params.idFavorito
    const returnArray = await svc.deleteFavorito(idFavorito);
    res.status(returnArray[1]).json(returnArray[0]);

});


export default router;