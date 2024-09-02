import LocalesRepository from "../repository/Locales-repository.js";
export default class LocalesService{
    getAllAsync = async () => {
        const repo = new LocalesRepository();
        let arrayRes = await repo.getAllAsync();
        return arrayRes;
    }

    getTop3Async = async () => {
        const repo = new LocalesRepository();
        let arrayRes = await repo.getTop3Async();
        return arrayRes;
    }
}