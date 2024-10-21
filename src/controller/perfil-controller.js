import { Router } from 'express';
import PerfilService from '../service/perfil-service.js';
import multer from 'multer';
import path from 'path';
const router = Router();
const svc = new PerfilService();

// Configuración de multer
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'uploads/'); // Carpeta donde se guardan las imágenes
    },
    filename: (req, file, cb) => {
        cb(null, Date.now() + path.extname(file.originalname)); // Nombre único para la imagen
    }
});

const upload = multer({ storage: storage });

// Middleware para verificar el token
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


// Endpoint para actualizar el perfil
router.put('/:idCliente', verifyToken, async (req, res) => {
    const idCliente = req.params.idCliente;
    const perfil = req.body;
    const returnArray = await svc.actualizarPerfil(perfil, idCliente);
    res.status(returnArray[1]).json(returnArray[0]);
});

export default router;
