//require
const decorador = require('./decorador');
const Producte = require('./Producte');


//productes en euros
// let pizzaGran = {"tipus": "Gran", "preu": 12, "moneda":"EUR"};
let pizzaGran = new Producte("Gran",12,"USD")
let pizzaPetita = new Producte("Petita",5, "GBP");

//Aplicar decorador
console.log(pizzaGran);
console.log(pizzaPetita);
pizzaGran = decorador(pizzaGran);
pizzaPetita = decorador(pizzaGran);
console.log(pizzaGran);
console.log(pizzaPetita);
