import ProductoRepository from "../repository/producto-repository.js";

export default class ProductoService {
    getAllByIdAsync = async (id) => {
        const repo = new ProductoRepository();
        return await repo.getAllByIdAsync(id);
    }

    getProductosFiltrados = async (productosFiltrados) => {
        const repo = new ProductoRepository();
        return await repo.getProductosFiltrados(productosFiltrados);
    }
}
