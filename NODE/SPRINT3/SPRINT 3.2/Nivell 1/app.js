const middleware = require("./funcions");
const fsp = require("fs/promises");

function suma(a, b) {
  return a + b;
}

function resta(a, b) {
  return a - b;
}

function multiplica(a, b) {
  return a * b;
}

//   cargar fitxer
let doc;
async function cargarfitxer(direccio) {
  try {
    doc = await fsp.readFile(direccio, "utf8");
    doc = JSON.parse(doc);
  } catch (err) {
    console.log(err);
  }
}

//Inicialització operacions
async function principal(direccio) {
  try {
    await cargarfitxer(direccio);
    console.log(suma(doc.a, doc.b));
    console.log(resta(doc.a, doc.b));
    console.log(multiplica(doc.a, doc.b));
    return 2;
  } catch (err) {
    console.log(err);
  }
}

//definicio de aplicacio;
const app = middleware();

//Middlewares

