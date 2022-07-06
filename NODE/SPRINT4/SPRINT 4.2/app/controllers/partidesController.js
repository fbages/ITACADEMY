const mysqlCrudService = require('../helpers/mysqlCrudService');

exports.jugarPartida = async (req, res, next) => {
    try {
        let idJugador = req.params.id;
        let dau1, dau2;
        dau1 = Math.floor(Math.random() * 6 + 1);
        dau2 = Math.floor(Math.random() * 6 + 1);
        let resultat = dau1 + dau2 == 7 ? 0 : 1;
        let partida = await serviceDb.crearPartida(idJugador, resultat, dau1, dau2);
        res.send(partida);
    } catch (err) {
        next(err);
    }
};

exports.eliminarPartides = async (req, res, next) => {
    try {
        let idJugador = req.params.id;
        await serviceDb.eliminarPartides(idJugador);
        res.send("Partida el.liminada");
    } catch (err) {
        console.log(err);
        next();
    }
};

exports.llistatPartides = async (req, res, next) => {
    try {
        let idJugador = req.params.id;
        let llistat = await serviceDb.llistatPartides(idJugador);
        res.send(llistat);
    } catch (err) {
        console.log(err);
        next();
    }
};
