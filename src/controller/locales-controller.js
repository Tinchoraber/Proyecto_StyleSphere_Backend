import { Router } from 'express';
import LocalesService from '../service/Locales-service.js'

const router = Router();
const svc = new LocalesService();

router.get('', async (req, res) => {
    const arrayDevuelto = await svc.getAllAsync();
    if (arrayDevuelto == null || arrayDevuelto.length === 0) {
        res.status(404).send('No se encontraron locales');
    } else {
        res.status(200).json(arrayDevuelto); // Asegúrate de devolver solo arrayDevuelto.rows
    }
});

router.get('/top3', async (req, res) => {
    const arrayDevuelto = await svc.getAllAsync();
    if (arrayDevuelto == null || arrayDevuelto.length === 0) {
        res.status(404).send('No se encontraron locales');
    } else {
        res.status(200).json(arrayDevuelto); // Asegúrate de devolver solo arrayDevuelto.rows
    }
});

export default router;