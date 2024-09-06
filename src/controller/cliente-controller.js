import { Router } from 'express';
import ClienteService from '../service/cliente-service.js';

const router = Router();
const svc = new ClienteService();

router.post('/login', async (req, res) => {
    const infoSesion = req.body
    const login = await svc.loginAsync(infoSesion);
    res.status(login[1]).json(login[0]);
});

export default router;