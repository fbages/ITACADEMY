// const dbMysql = require("../helpers/configMysql");
// const dbBD = require("../helpers/configMongoDB");

exports.jugarPartida = async (req, res, next) => {
    try {
        let idjugador = req.params.id;
        let dau1, dau2;
        dau1 = Math.floor(Math.random() * 6 + 1);
        dau2 = Math.floor(Math.random() * 6 + 1);
        let resultat = dau1 + dau2 == 7 ? 0 : 1;
        
        let partides,
            quantitatPartides,
            partidesGuanyades,
            quantitatPartidesGuanyades,
            percentatge,
            jugador;

        let partida = await dbMysql.Partides.create({
            idjugador: idjugador,
            resultat: resultat,
            dau1: dau1,
            dau2: dau2,
        });
        partides = await dbMysql.Partides.findAll({
            where: { idjugador: idjugador },
        });
        quantitatPartides = partides.length;
        partidesGuanyades = await dbMysql.Partides.findAll({
            where: { idjugador: idjugador, resultat: 0 },
        });
        quantitatPartidesGuanyades = partidesGuanyades.length;
        percentatge = Number(
            quantitatPartidesGuanyades / quantitatPartides
        ).toFixed(2);
        jugador = await dbMysql.Jugadors.findOne({ where: { id: idjugador } });
        Object.assign(jugador, { percentatge: percentatge });
        await jugador.save();
        res.send(partida);
    } catch (err) {
        next(err);
    }
};

exports.eliminarPartides = async (req, res, next) => {
    try {
        let idjugador = req.params.id;
        await dbMysql.Partides.destroy({ where: { idjugador: idjugador } });
        res.send("Partida el.liminada");
    } catch (err) {
        console.log(err);
        next();
    }
};

exports.llistatPartides = async (req, res, next) => {
    try {
        let idJugador = req.params.id;
        let llistat = await dbMysql.Partides.findAll({
            where: { idjugador: idJugador },
        });
        res.send(llistat);
    } catch (err) {
        console.log(err);
        next();
    }
};
