const db = require('../helpers/configMysql');
const { validationResult } = require('express-validator');

exports.crearJugador = async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        // console.log(req['express-validator#contexts'][0]);
        return res.status(400).json({ errors: errors.array() });
    }
    try {
        let nomJugador = req.params.nom;
        //console.log(nomJugador);
        let jugador = await db.Jugadors.create({ nom: nomJugador, percentatge: 0, data_registre: new Date })
        res.send(jugador);
    } catch (err) {
        console.log(err);
        next();
    }
}

exports.actualitzarNomJugador = async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.status(400).json({ errors: errors.array() });
    }
    try {
        let idNom = req.params.id;
        let nom = req.query.nom;
        let nouNom = { "nom": nom };
        let jugador = await db.Jugadors.findOne({ where: { id: idNom } });
        Object.assign(jugador, nouNom);
        // console.log(jugador);
        await jugador.save();
        res.send(jugador);
    } catch (err) {
        console.log(err);
        next();
    }
}

exports.llistatJugadors = async (req, res, next) => {
    try {
        let llistat = await db.Jugadors.findAll({});
        // console.log(llistat.nom);
        res.send(llistat);
    } catch (err) {
        console.log(err);
        next();
    }
}
