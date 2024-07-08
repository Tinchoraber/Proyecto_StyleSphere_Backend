import BuscadorRepository from "../repository/buscador-repository.js";
export default class BuscadorService{
    searchAsync = async (buscado) => {
        const repo = new BuscadorRepository();
        let arrayRes = await repo.searchAsync(buscado);
        return arrayRes;
    }
}