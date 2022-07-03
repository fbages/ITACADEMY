const db = require('../helpers/configMysql');

exports.jugarPartida = async (req, res, next) => {
    try {
        let idjugador = req.params.id;
        let dau1, dau2;
        dau1 = Math.floor(Math.random() * 6 + 1);
        dau2 = Math.floor(Math.random() * 6 + 1);
        let resultat = (dau1 + dau2 == 7) ? 0 : 1;
        let partida = await db.Partides.create({ "idjugador": idjugador, "resultat": resultat, "dau1": dau1, "dau2": dau2 });
        let partides = await db.Partides.findAll({ where: { "idjugador": idjugador } });
        let quantitatPartides = partides.length;
        let partidesGuanyades = await db.Partides.findAll({ where: { "idjugador": idjugador, "resultat": 0 } });
        let quantitatPartidesGuanyades = partidesGuanyades.length;
        let percentatge = Number(quantitatPartidesGuanyades / quantitatPartides).toFixed(2);
        let jugador = await db.Jugadors.findOne({ where: { "id": idjugador } });
        Object.assign(jugador, { "percentatge": percentatge });
        await jugador.save();
        res.send(partida);
    } catch (err) {
        // console.log(err);
        next(err);
    }
}

exports.eliminarPartides = async (req, res, next) => {
    try {
        let idjugador = req.params.id;
        await db.Partides.destroy({ where: { "idjugador": idjugador}});
        res.send("Partida el.liminada");
    } catch (err) {
        console.log(err);
        next();
    }
}

exports.llistatPartides = async (req, res, next) => {
    try {
        let idJugador = req.params.id;
        let llistat = await db.Partides.findAll({ where: { idjugador: idJugador } });
        res.send(llistat);
    } catch (err) {
        console.log(err);
        next();
    }
}
