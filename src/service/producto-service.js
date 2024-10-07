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

    getProductosByMarca = async (idTienda) => {
        const repo = new ProductoRepository();
        return await repo.getProductosByMarca(idTienda);
    }

    getAllFilteredAsync = async (idTipoProducto, talle, color, precioMin, precioMax) => {
        const repo = new ProductoRepository();
        let arrayRes = await repo.getAllFilteredAsync(idTipoProducto, talle, color, precioMin, precioMax);
        return arrayRes;
    }

    getProductosFiltradosTienda = async (productosFiltrados, idTienda) => {
        const repo = new ProductoRepository();
        return await repo.getProductosFiltradosTienda(productosFiltrados, idTienda);
    }

    getProductoById = async (idProducto) => {
        const repo = new ProductoRepository();
        return await repo.getProductoById(idProducto);
    }
}
