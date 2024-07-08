import ProductoRepository from "../repository/producto-repository.js";
export default class ProductoService{
    getAllByIdAsync = async (id) => {
        const repo = new ProductoRepository();
        let arrayRes = await repo.getAllByIdAsync(id);
        return arrayRes;
    }
}