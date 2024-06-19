import tipoProductoRepository from "../repository/tipoProducto-repository.js";
export default class tipoProductoService{
    getAllAsync = async () => {
        const repo = new tipoProductoRepository();
        let arrayRes = await repo.getAllAsync();
        return arrayRes;
    }
}