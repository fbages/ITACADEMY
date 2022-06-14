const EventEmitter = require("events").EventEmitter;

class Usuari {
    constructor(nomUsuari) {
        this.nom = nomUsuari;
    }

    getNom() {
        return this.nom
    }

    enviarMissatge(tema, missatge) {
        tema.emit('Missatge enviat', missatge);
    }

    rebutMissatge(){
        this.on('totsInformats',()=>{
            console.log(this.getNom() + 'Informat');
        })
    }
    


}

class Tema extends EventEmitter {
    constructor(nomTema, numUsuaris) {
        super();
        this.nom = nomTema;
        this.missatges = [];
        this.usuaris = [];
        for (let i = 0; i < numUsuaris; i++) {
            this.subscribe(`Nom ${i}`);
        }
    }

    subscribe(usuari) {
        this.usuaris.push(usuari);
        this.emit("usuariSubscrit");

    }

    desubscribe(usuariNom) {
        let index = this.usuaris.findIndex(usuari => usuari.nom === usuariNom);
        this.usuaris.splice(index, 1);
        this.emit("usuariDesconectat");
    }

    notificar() {
        this.emit("totsInformats");
    }

}

function creacioTemesAmbUsuaris(nomTema, numUsuaris) {
    temes.push(new Tema(nomTema, numUsuaris));
}


//Inicialització temes

let temes = [];
creacioTemesAmbUsuaris("Informació");
creacioTemesAmbUsuaris("Anuncis");
console.table(temes);

let usuaris = [];
usuaris.push(new Usuari("Usuari 1"));
usuaris.push(new Usuari("Usuari 2"));
usuaris.push(new Usuari("Usuari 3"));


//Listeners dels temes
for (let i = 0; i < temes.length; i++) {

    temes[i].on('usuariSubscrit', () => {
        console.log("un usuari s'ha subscrit");
        console.table(temes);
    });

    temes[i].on('usuariDesconectat', () => {
        console.log("un usuari s'ha desubscrit");
        console.table(temes);
    });

    temes[i].on('Missatge enviat', (missatge) => {
        temes[i].missatges.push(missatge);
        console.table(temes);
        temes[i].notificar();
    })
}


//Inicialitzacio usuaris
temes[0].subscribe("Usuari 1");
temes[1].subscribe("Usuari 2");
temes[1].subscribe("Usuari 3");

//temes[1].desubscribe("Usuari 3");
console.table(temes);

//Inicialitzacio missatges
usuaris[0].enviarMissatge(temes[0], "Missatge prova 1");
usuaris[1].enviarMissatge(temes[1], "Missatge prova 2");
