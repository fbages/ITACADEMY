const http = require('http');
//const sequelize = require('../config/configDB');
//const Jugador = require('../models/jugadorModel');
const db = require('../helpers/configMysql');

exports.crearJugador = async (req,res,next) => {
    let nomJugador = req.params.nom;
    console.log(nomJugador);
    
    try{
        db.create({nom:nomJugador,data_registre:new Date}).then(
            res.send("Rebut")
            );
        }catch(err){
            console.log(err);
        }
}

exports.actualitzarJugador = async (req,res,next) => {

}

exports.llistatJugadors = async (req,res,next) => {

}