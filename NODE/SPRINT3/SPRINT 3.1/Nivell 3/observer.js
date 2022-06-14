const EventEmitter = require("events").EventEmitter;

class Usuari extends EventEmitter {
  constructor(nomUsuari) {
    super();
    this._nom = nomUsuari;
    this.on("totsInformats", (missatge) => {
      console.log(this.getNom() + " Informat del nou missatge : " + missatge);
    });
  }

  getNom() {
    return this._nom;
  }

  enviarMissatge(tema, missatge) {
    tema.emit("Missatge", missatge);
  }

}

class Tema extends EventEmitter {
  constructor(nomTema, numUsuaris) {
    super();
    this._nom = nomTema;
    this._missatges = [];
    this._usuaris = [];
    // for (let i = 0; i < numUsuaris; i++) {
    //     this.subscribe(`Nom ${i}`);
    // }
    this.on("usuariSubscrit", () => {
      console.log("un usuari s'ha subscrit");
      // console.table(temes);
    });

    this.on("usuariDesconectat", (usuari) => {
      console.log(`${usuari._nom} s'ha desubscrit `);
      // console.table(temes);
    });

    this.on("Missatge", missatge => {
      this._missatges.push(missatge);
      console.log(`S'ha rebut un missatge nou`)
      this.notificar();
    });
  }

  subscribe(usuari) {
    this._usuaris.push(usuari);
    this.emit("usuariSubscrit");
  }

  desubscribe(usuariDesubscrit) {
    // console.log(usuariDesubscrit);
    let index = this._usuaris.findIndex((usuari) => usuari._nom === usuariDesubscrit._nom);
    // console.log(index);
    this._usuaris.splice(index, 1);
    this.emit("usuariDesconectat", usuariDesubscrit);
  }

  notificar() {
    console.log(
      `Des del tema ${this._nom}, s'informa a tots els usuaris subscrits.`
    );
    for (let usuari of this._usuaris) {
      usuari.emit("totsInformats", this._missatges[this._missatges.length-1]);
    }
  }
}

function creacioTemesAmbUsuaris(nomTema, numUsuaris) {
  temes.push(new Tema(nomTema, numUsuaris));
}

//Inicialització temes

let temes = [];
creacioTemesAmbUsuaris("Informació");
creacioTemesAmbUsuaris("Anuncis");
//console.table(temes);

let usuaris = [];
usuaris.push(new Usuari("Usuari 1"));
usuaris.push(new Usuari("Usuari 2"));
usuaris.push(new Usuari("Usuari 3"));

//Inicialitzacio usuaris
temes[0].subscribe(usuaris[0]);
temes[1].subscribe(usuaris[1]);
temes[1].subscribe(usuaris[2]);


//Inicialitzacio missatges
usuaris[0].enviarMissatge(temes[0], "Missatge prova 1");
usuaris[1].enviarMissatge(temes[1], "Missatge prova 2");
temes[1].desubscribe(usuaris[2]);
usuaris[1].enviarMissatge(temes[1], "Missatge prova 3");
