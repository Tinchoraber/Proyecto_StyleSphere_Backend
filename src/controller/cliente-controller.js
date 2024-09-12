import { Router } from 'express';
import ClienteService from '../service/cliente-service.js';

const router = Router();
const svc = new ClienteService();

router.get('/login', async (req, res) => {
    const infoSesion = req.body
    const login = await svc.loginAsync(infoSesion);
    res.status(login[1]).json(login[0]);
});

router.post('/register', async (req, res) => {
    const infoSesion = req.body
    console.log(infoSesion)
    const register = await svc.registerAsync(infoSesion);
    console.log(register, "aaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    res.status(register[1]).send(register[0]);
});

export default router;