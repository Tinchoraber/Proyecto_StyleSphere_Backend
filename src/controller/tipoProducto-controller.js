import { Router } from 'express';
import tipoProductoService from '../service/tipoProducto-service.js';

const router = Router();
const svc = new tipoProductoService();

router.get('', async (req, res) => {
    const arrayDevuelto = await svc.getAllAsync();
    if (arrayDevuelto == null || arrayDevuelto.length === 0) {
        res.status(404).send('No se encontraron tipos de producto');
    } else {
        res.status(200).json(arrayDevuelto); // Asegúrate de devolver solo arrayDevuelto.rows
    }
});

export default router;
