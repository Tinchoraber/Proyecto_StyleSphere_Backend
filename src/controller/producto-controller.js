import { Router } from 'express';
import ProductoService from '../service/producto-service.js';

const router = Router();
const svc = new ProductoService();

router.get('/:id', async (req, res) => {
    const id = req.params.id;
    const arrayDevuelto = await svc.getAllByIdAsync(id);
    if (arrayDevuelto == null || arrayDevuelto.length === 0) {
        res.status(404).send('No hay productos');
    } else {
        res.status(200).json(arrayDevuelto); // Asegúrate de devolver solo arrayDevuelto.rows
    }
});

export default router;