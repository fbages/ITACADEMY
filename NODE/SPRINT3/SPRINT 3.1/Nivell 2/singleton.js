//Crear diversos jugadors en un joc
class Joc {

    constructor(num_jugadors) {
        this.jugadors = [];
        for (let i = 0; i < num_jugadors; i++) {
            this.jugadors[i] = new Jugador(`Nom + ${i}`);
        }
    }
    getNumJugadors() {
        return this.jugadors.length;
    }

    getJugador(index){
        return this.jugadors[index];
    }
    jugadorGuanyador() {
        let puntsFinals = [];
        let i=0;
        for (let jugador of this.jugadors) {
            puntsFinals.push(jugador.marcador.getPuntuacio());
        }

        let max = Math.max(...puntsFinals);
        console.table(puntsFinals);
        console.log(`El valor màxim és : ${max}`);
    
        return puntsFinals.indexOf(max);
    }


}

class Jugador {
    constructor(nom) {
        this.nom = nom;
        this.marcador = new Marcador
    }

    getNom() {
        return this.nom;
    }

}

class Marcador {
    constructor() {
        this.puntuacio = 0;
    }

    getPuntuacio() {
        return this.puntuacio;
    }

    setPuntuacio(punts) {
        this.puntuacio += punts;
    }
}

function tirar(jugador) {
    let numAleatori = Math.floor(Math.random() * 10); //Num aleatori de 0 a 9
    let signeAleatori = Math.random() > 0.5 ? (1) : (-1); //Simbol aleatori
    let puntsTirada = numAleatori * signeAleatori;
    console.log(puntsTirada);
    jugador.marcador.setPuntuacio(puntsTirada);
    puntsTirada > 0 ? console.log(`Guanyes ${puntsTirada} punts`) : console.log(`Perds ${puntsTirada} punts`)
}


function iniciJoc() {

    let joc1 = new Joc(5);

    let partidesJoc = 10;
    for (let i = 0; i < partidesJoc; i++) {
        for (let j = 0; j < joc1.getNumJugadors(); j++) {
            console.log(joc1.getJugador(j));
            tirar(joc1.getJugador(j));
            console.log(`Tens ${joc1.jugadors[j].marcador.getPuntuacio()} punts`);
        }
    }
    console.log(`El guanyador és Nom + ${joc1.jugadorGuanyador()}`)
}

iniciJoc();