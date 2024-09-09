import FavoritoRepository from "../repository/favorito-repository.js";
export default class FavoritoService{
    insertFavoritoAsync = async (idProducto, idCliente) => {
        const repo = new FavoritoRepository();
        let arrayRes = await repo.insertFavoritoAsync(idProducto, idCliente);
        return arrayRes;
    }
}