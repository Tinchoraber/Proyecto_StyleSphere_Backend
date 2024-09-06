import ClienteRepository from "../repository/cliente-repository.js";
export default class ClienteService {
    loginAsync = async (body) => {
        const repo = new ClienteRepository();
        let arrayRes = await repo.loginAsync(body);
        return arrayRes;
      };
}