const db = require('../helpers/configMysql');
const sequelize = require('sequelize');

exports.llistatGuanyadors = async (req,res,next) => {
    //fer una busqueda a mysql ordenant per percentatge
    let llistat = [];
    llistat = await db.Jugadors.findAll({
        attributes: ['nom', 'percentatge'],
        order: [["percentatge", "DESC"]]
    });
    res.send(llistat);
}

exports.perdedor = async (req,res,next) => {
    let llistat = [];
    llistat = await db.Jugadors.findAll({
        attributes: ['nom', 'percentatge'],
        order: [["percentatge", "ASC"]],
        limit: [1]
    });
    res.send(llistat);
}

exports.guanyador = async (req,res,next) => {
    let llistat = [];
    llistat = await db.Jugadors.findAll({
        attributes: ['nom', 'percentatge'],
        order: [["percentatge", "DESC"]],
        limit: [1]
    });
    res.send(llistat);
}