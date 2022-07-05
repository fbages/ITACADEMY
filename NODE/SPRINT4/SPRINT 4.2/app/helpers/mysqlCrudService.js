const sequelize = require('sequelize');

module.exports = serviceDb = {
    rankingSorted,
    perdedor,
    guanyador
}



async function crearJugador(nomJugador){  
        return await dbMysql.Jugadors.create({ nom: nomJugador, percentatge: 0, data_registre: new Date })
}



async function rankingSorted() {
    return await dbMysql.Jugadors.findAll({
        attributes: ['nom', 'percentatge'],
        order: [["percentatge", "DESC"]]
    });

}

async function perdedor() {
    return await dbMysql.Jugadors.findAll({
        attributes: ['nom', 'percentatge'],
        order: [["percentatge", "ASC"]],
        limit: [1]
    });

}

async function guanyador() {
    return await dbMysql.Jugadors.findAll({
        attributes: ['nom', 'percentatge'],
        order: [["percentatge", "DESC"]],
        limit: [1]
    });
}
