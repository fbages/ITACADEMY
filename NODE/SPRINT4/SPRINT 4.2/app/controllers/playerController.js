const http = require('http');
const sequelize = require('../config/configDB');
const Jugador = require('../models/jugadorModel');

exports.crearJugador = async (req,res,next) => {
    let nomJugador = req.params.nom;
    console.log(nomJugador);
    
    try{
        Jugador.create({nom:nomJugador}).then(
            res.send("Rebut")
            );
        }catch(err){
            console.log(err);
        }
}

exports.actualitzarJugador = (req,res,next) => {

}

exports.llistatJugadors = (req,res,next) => {

}