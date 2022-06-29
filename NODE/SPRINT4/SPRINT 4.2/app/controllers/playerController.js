const db = require('../helpers/configMysql');

exports.crearJugador = async (req,res,next) => {
    let nomJugador = req.params.nom;
    
    
    try{
        await db.Jugador.create({nom:nomJugador,data_registre:new Date})
        res.send("Rebut");
        
        }catch(err){
            console.log(err);
        }
}

exports.actualitzarJugador = async (req,res,next) => {

}

exports.llistatJugadors = async (req,res,next) => {

}