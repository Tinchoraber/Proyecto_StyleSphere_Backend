import { Router } from 'express';
import ClienteService from '../service/cliente-service.js';
const router = Router();
const svc = new ClienteService();



router.post('/login', async (req, res) => {
    const infoSesion = req.body
    const login = await svc.loginAsync(infoSesion);
    res.status(login[1]).json(login[0]);
});

router.post('/register', async (req, res) => {
    const infoSesion = req.body;
    console.log(infoSesion);
    const register = await svc.registerAsync(infoSesion);

    res.status(register[1]).json(register[0]);
});

router.put('/actualizarContra', async (req, res) => {
    const email = req.body.email;
    const nuevaContraseña = req.body.contraseña;
    const result = await svc.updateContraseña(email, nuevaContraseña);

    res.status(result[1]).json(result[0]);
});


export default router;