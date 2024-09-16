import FavoritoRepository from "../repository/favorito-repository.js";
export default class FavoritoService{
    getFavorito = async (idCliente) => {
        const repo = new FavoritoRepository();
        let arrayRes = await repo.getFavorito(idCliente);
        return arrayRes;
    }

    insertFavoritoAsync = async (idProducto, idCliente) => {
        const repo = new FavoritoRepository();
        let arrayRes = await repo.insertFavoritoAsync(idProducto, idCliente);
        return arrayRes;
    }

    deleteFavorito = async (idFavorito) => {
        const repo = new FavoritoRepository();
        let arrayRes = await repo.deleteFavorito(idFavorito);
        return arrayRes;
    }
    
}