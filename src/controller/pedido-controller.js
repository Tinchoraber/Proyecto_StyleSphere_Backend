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


/*router.get('', verifyToken, async (req, res) => {
    try {
        const idCliente = req.user.idCliente; 
        const returnArray = await svc.getAllTarjetasFromClienteAsync(idCliente);
        res.status(returnArray[1]).json(returnArray[0]);
    } catch (error) {
        res.status(500).json({ message: 'Error al obtener las tarjetas', error: error.message });
    }
});*/

router.post('/agregar', verifyToken, async (req, res) => {
    try {
        console.log('Datos recibidos:', req.body);
        const { productos, precioTotal, idDetallePedido } = req.body;
        
        // Validar que productos sea un array y no esté vacío
        if (!productos || !Array.isArray(productos) || productos.length === 0 || !precioTotal) {
            return res.status(400).json({ 
                error: 'Se requiere un array de productos y el precio total',
                received: req.body
            });
        }

        // Validar que todos los productos tengan los campos necesarios
        for (const producto of productos) {
            if (!producto.idCarrito || producto.precio === undefined || producto.cantidadAComprar === undefined) {
                return res.status(400).json({ 
                    error: 'Cada producto debe tener idCarrito, precio y cantidadAComprar',
                    received: producto
                });
            }
        }

        if (idDetallePedido) {
            // Si existe el idDetallePedido, actualizamos el pedido
            const [resultado, statusCode] = await svc.actualizarPedido(productos, precioTotal, idDetallePedido);
            res.status(statusCode).json(resultado);
        } else {
            // Si no existe, creamos un nuevo pedido
            const [resultado, statusCode] = await svc.crearPedido(productos, precioTotal);
            res.status(statusCode).json(resultado);
        }
    } catch (error) {
        console.error('Error en controller:', error.message);
        res.status(500).json({ 
            error: error.message || 'Error al crear o actualizar el pedido'
        });
    }
}); 

router.get('/:idDetallePedido', verifyToken, async (req, res) => {
    try {
        const idDetallePedido = req.params.idDetallePedido;
        
        if (!idDetallePedido) {
            return res.status(400).json({ 
                error: 'Se requiere el ID del detalle del pedido'
            });
        }

        const [resultado, statusCode] = await svc.obtenerPedidoById(idDetallePedido);
        res.status(statusCode).json(resultado);
    } catch (error) {
        console.error('Error en controller:', error.message);
        res.status(500).json({ 
            error: error.message || 'Error al obtener el pedido'
        });
    }
});

export default router;