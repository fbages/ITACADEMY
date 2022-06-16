const Middleware = require("./middleware");
const fsp = require("fs/promises");
const Calculadora = require("./calculadora");

console.clear();
const cal1 = new Calculadora();
console.log(cal1.suma({a: 1, b: 10}));
//definicio del middleware manager;
const app = new Middleware(cal1);

//insertar els middleware
app.use(quadrat);
app.use(cub);
app.use(divideix);

//   cargar fitxer
let doc;
async function cargarfitxer(direccio) {
  try {
    doc = await fsp.readFile(direccio, "utf8");
    doc = JSON.parse(doc);
    return doc;
  } catch (err) {
    console.log(err);
  }
}

//Inicialització operacions
async function principal(direccio) {
  try {
    let data = await cargarfitxer(direccio);
    console.log(data);
    //app.run(data);

    console.log(app.run(cal1.suma({a: 5, b: 10})));
    
  } catch (err) {
    console.log(err);
  }
}

//Funcions Middleware

function quadrat(data) {
  return new Promise((resolve) => {
    setTimeout(() => {
      data.a = data.a ** 2;
      data.b = data.b ** 2;
      resolve(console.log("Resultat al quadrat : " + JSON.stringify(data)));
    }, 2000);
  });
}

function cub(data) {
  data.a = data.a ** 3;
  data.b = data.b ** 3;
  return new Promise((resolve) => {
    resolve(console.log("Resultat al cub : " + JSON.stringify(data)));
  });
}

function divideix(data) {
  data.a = data.a / 2;
  data.b = data.b / 2;
  return new Promise((resolve) => {
    resolve(console.log("Resultat al dividir : " + JSON.stringify(data)));
  });
}

//Executar funcions que passin pels middlewares
principal('./input.json');