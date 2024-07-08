import { Router } from 'express';
import BuscadorService from '../service/buscador-service.js';

const router = Router();
const svc = new BuscadorService();

router.get('', async (req, res) => {
    const buscado = req.query.buscado;
    const arrayDevuelto = await svc.searchAsync(buscado);
});

export default router;