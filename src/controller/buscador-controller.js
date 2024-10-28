import { Router } from 'express';
import BuscadorService from '../service/buscador-service.js';

const router = Router();
const svc = new BuscadorService();

router.get('/:buscado', async (req, res) => {
    const buscado = req.params.buscado;
    const arrayDevuelto = await svc.searchAsync(buscado);
    if (arrayDevuelto == null || arrayDevuelto.length === 0) {
        res.status(404).send('No se encontraron resultados');
    } else {
        res.status(200).json(arrayDevuelto); 
    }
});
router.get('/local/:buscado', async (req, res) => {
    const buscado = req.params.buscado;
    const arrayDevuelto = await svc.searchAsyncByLocal(buscado);
    if (arrayDevuelto == null || arrayDevuelto.length === 0) {
        res.status(404).send('No se encontraron resultados');
    } else {
        res.status(200).json(arrayDevuelto);
    }
});

export default router;