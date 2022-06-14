const funcions = require("./funcions");
const fsp = require("fs/promises");
const { appendFile } = require("fs");

function suma(a, b) {
  return a + b;
}

function resta(a, b) {
  return a - b;
}

function multiplica(a, b) {
  return a * b;
}

// app.use(funcions);

//   cargar fitxer
let doc;
async function cargarfitxer() {
  try {
    doc = await fsp.readFile("./input.json", "utf8");
    doc = JSON.parse(doc);
  } catch (err) {
    console.log(err);
  }
}

//Inicialització operacions
async function principal() {
  try {
    await cargarfitxer();
    console.log(suma(doc.a, doc.b));
    console.log(resta(doc.a, doc.b));
    console.log(multiplica(doc.a, doc.b));
    
  } catch (err) {
    console.log(err);
  }
}

principal();
