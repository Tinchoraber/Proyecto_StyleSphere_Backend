import ClienteRepository from "../repository/cliente-repository.js";
export default class ClienteService {
  loginAsync = async (body) => {
    const repo = new ClienteRepository();
    let arrayRes = await repo.loginAsync(body);
    return arrayRes;
  };

  registerAsync = async (body) => {
    const repo = new ClienteRepository();
    let arrayRes = await repo.registerAsync(body);
    return arrayRes;
  };

  updateContraseña = async (email, nuevaContraseña) => {
    const repo = new ClienteRepository();
    let arrayRes = await repo.updateContraseña(email, nuevaContraseña);
    return arrayRes;
  };
}
