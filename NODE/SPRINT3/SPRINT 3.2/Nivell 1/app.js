const Middleware = require("./middleware");
const fsp = require("fs/promises");
const Calculadora = require("./calculadora");

console.clear();
const cal1 = new Calculadora();

//definicio del middleware manager;
const app = new Middleware();

//insertar els middleware
app.use(quadrat);
app.use(cub);
app.use(divideix);

//   cargar fitxer
async function cargarfitxer(direccio) {
  try {
    let doc = await fsp.readFile(direccio, "utf8");
    doc = JSON.parse(doc);
    console.log(doc);
    return doc;
  } catch (err) {
    console.log(err);
  }
}


//Inicialització operacions
async function principal(direccio) {
  try {
    const dataInicial = await cargarfitxer(direccio);
    Object.freeze(dataInicial);
    let x,y,z;
    x = { "a": dataInicial.a, "b": dataInicial.b};
    y = Object.assign({},x);
    z = Object.assign({},x);
    app.run(x, cal1.suma);
    //x = { "a": dataInicial.a, "b": dataInicial.b}; //Alternativa a crear y i z
    app.run(y, cal1.resta);
    //x = { "a": dataInicial.a, "b": dataInicial.b};
    app.run(z, cal1.multiplica);
    
  } catch (err) {
    console.log(err);
  }
}

//Funcions Middleware amb next

function quadrat(data,next) {
  //console.log(next.toString());
      data.a = data.a ** 2;
      data.b = data.b ** 2;
      console.log("Resultat al quadrat : " + JSON.stringify(data));
      next();
}

function cub(data,next) {
  data.a = data.a ** 3;
  data.b = data.b ** 3;
  console.log("Resultat al cub : " + JSON.stringify(data));
  next();
}

function divideix(data,next) {
  data.a = data.a / 2;
  data.b = data.b / 2;
  console.log("Resultat al dividir : " + JSON.stringify(data));
  next();
}


//Executar funcions que passin pels middlewares
principal('./input.json');

