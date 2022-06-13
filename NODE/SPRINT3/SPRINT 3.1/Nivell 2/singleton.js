//Crear diversos jugadors en un joc
class Joc {

    constructor(numJugadors) {
        this.jugadors = [];
        for (let i = 0; i < numJugadors; i++) {
            this.jugadors[i] = new Jugador(`Nom ${i}`);
        }
        this.marcador = new Marcador(numJugadors);
        this.marcador2 = new Marcador(100); //No generar una nova instacia de la clase Marcador, retorna la ja creada sense modificarla
    }
    getNumJugadors() {
        return this.jugadors.length;
    }

    getJugador(index){
        return this.jugadors[index];
    }
    jugadorGuanyador() {
        let max = Math.max(...this.marcador.puntuacions);
        console.table(this.marcador.puntuacions);
        console.log(`El valor màxim és : ${max}`);
    
        return this.marcador.puntuacions.indexOf(max);
    }


}

class Jugador {
    constructor(nom) {
        this.nom = nom;
    }

    getNom() {
        return this.nom;
    }

}

class Marcador {
    constructor(numJugadors) {
        this.puntuacions = [];
        for (let i=0;i<numJugadors;i++){
            this.puntuacions.push(0);
        }

        if (typeof Marcador.instance === 'object'){
            return Marcador.instance;
        }
        
        Marcador.instance = this;
        return this

    }

    getPuntuacio(jugador) {
        return this.puntuacions[jugador];
    }

    setPuntuacio(jugador,punts) {
        this.puntuacions[jugador] += punts;
    }
}

function tirar(joc,jugador) {
    let numAleatori = Math.floor(Math.random() * 10); //Num aleatori de 0 a 9
    let signeAleatori = Math.random() > 0.5 ? (1) : (-1); //Simbol aleatori
    let puntsTirada = numAleatori * signeAleatori;
    console.log(puntsTirada);
    joc.marcador.setPuntuacio(jugador,puntsTirada);
    puntsTirada > 0 ? console.log(`Guanyes ${puntsTirada} punts`) : console.log(`Perds ${puntsTirada} punts`);
}


function iniciJoc() {

    let joc1 = new Joc(5);

    let partidesJoc = 10;
    for (let i = 0; i < partidesJoc; i++) {
        for (let j = 0; j < joc1.getNumJugadors(); j++) {
            console.log(joc1.getJugador(j));
            tirar(joc1,j);
            console.log(`Tens ${joc1.marcador.getPuntuacio(j)} punts`);
        }
    }
    console.log(`El guanyador és Nom ${joc1.jugadorGuanyador()}`);
    console.log(joc1);
}

iniciJoc();