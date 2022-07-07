
module.exports = serviceDb = { //Declaracio global de serviceDB
    crearJugador,
    modificarNomJugador,
    llistatJugadors,
    crearPartida,
    eliminarPartides,
    llistaPartides,
    rankingSorted,
    perdedor,
    guanyador
}



async function crearJugador(nomJugador) {
    console.log("Index crear" , dbMongoDB.maxIndex);
    return await dbMongoDB.Jugadors.create({ id: dbMongoDB.maxIndex ,nom: nomJugador, percentatge: 0, data_registre: new Date })
}

async function modificarNomJugador(idJugador, nouNom) {
    const jugador = await dbMongoDB.Jugadors.findOne({id: idJugador });
    Object.assign(jugador, nouNom);
    await jugador.save();
    return jugador;
}

async function llistatJugadors() {
    return await dbMongoDB.Jugadors.find({})
}

async function crearPartida(idJugador, resultat, dau1, dau2) {
    let partides,
        quantitatPartides,
        partidesGuanyades,
        quantitatPartidesGuanyades,
        percentatge,
        jugador;

    let partida = await dbMongoDB.Partides.create({
        idjugador: idJugador,
        resultat: resultat,
        dau1: dau1,
        dau2: dau2,
    });
    partides = await dbMongoDB.Partides.find({idjugador: idJugador});
    quantitatPartides = partides.length;
    partidesGuanyades = await dbMongoDB.Partides.find({idjugador: idJugador, resultat: 0});
    quantitatPartidesGuanyades = partidesGuanyades.length;
    percentatge = Number(
        quantitatPartidesGuanyades / quantitatPartides
    ).toFixed(2);
    //console.log(percentatge);
    jugador = await dbMongoDB.Jugadors.findOne({ idjugador: idJugador});
    Object.assign(jugador, { percentatge: percentatge });
    await jugador.save();
    return partida;
}

async function eliminarPartides(idJugador) {
    return await dbMongoDB.Partides.deleteOne({ idjugador: idJugador});
}

async function llistaPartides(idJugador) {
    return await dbMongoDB.Partides.find({ idjugador: idJugador});
}

async function rankingSorted() {
    return await dbMongoDB.Jugadors.find({}).sort({percentatge:-1}).select({nom:1,percentatge:1});
}

async function perdedor() {
    return await dbMongoDB.Jugadors.find({}).limit(1).sort({percentatge:1}).select({nom:1,percentatge:1});
}

async function guanyador() {
    return await dbMongoDB.Jugadors.find({}).limit(1).sort({percentatge:-1}).select({nom:1,percentatge:1});
}
