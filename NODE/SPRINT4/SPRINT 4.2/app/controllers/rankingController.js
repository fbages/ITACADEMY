
exports.llistatGuanyadors = async (req, res, next) => {
    res.send(await serviceDb.rankingSorted());
}

exports.perdedor = async (req, res, next) => {
    res.send(await serviceDb.perdedor());
}

exports.guanyador = async (req, res, next) => {
     console.log(serviceDb);
     console.log(dbMysql);
    res.send(await serviceDb.guanyador());
}