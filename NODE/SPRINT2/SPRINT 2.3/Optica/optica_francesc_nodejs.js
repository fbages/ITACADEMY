const { ObjectId } = require('mongodb');

let MongoClient = require('mongodb').MongoClient;
let url = "mongodb://localhost:27017/";

MongoClient.connect(url, function (err, db) {
    if (err) throw err;
    console.log('Base de dades optica_francesc creada');

    var dbo = db.db("optica_francesc");
    dbo.dropDatabase();

    async function inser() {

        dbo = db.db("optica_francesc");

        dbo.createCollection("proveidors", function (err, res) {
            if (err) throw err;

            console.log('Coleccio proveidors creada!');
            let proveidor1 = {
                _id: ObjectId("62a066f783e14e37be84cb34"),
                nom: "Proveidor 1",
                adreça: "Carrer Lepant,63,3,1,Barcelona,08025,Espanya",
                telefon: 932450025,
                fax: 932450026,
                nif: "591451343X"
            };
            let proveidor2 = {
                _id: ObjectId("62a066f783e14e37be84cb35"),
                nom: "Proveidor 2",
                adreça: "Carrer Diagonal',523,6,2,'Barcelona',08021,'Espanya",
                telefon: 9324344025,
                fax: 9324430026,
                nif: "591434333A"
            };
            let proveidors = [proveidor1, proveidor2];
            dbo.collection("proveidors").insertMany(proveidors, function (err, res) {
                if (err) throw err;
                console.log("1 document inserted");

            });

        });

        dbo.createCollection("ulleres", function (err, res) {
            if (err) throw err;
            console.log('Coleccio ulleres creada!');
            let ulleres1 = {
                proveidor: ObjectId("62a066f783e14e37be84cb35"),
                marca: "Gucci",
                graduacio_dreta: 1.3,
                graduacio_esquerra: 1.6,
                tipus_muntura: "pasta",
                color_muntura: "verd",
                preu: 300
            };

            let ulleres2 = {
                proveidor: ObjectId("62a066f783e14e37be84cb34"),
                marca: "Rayban",
                graduacio_dreta: 1.1,
                graduacio_esquerra: 1.2,
                tipus_muntura: "flotant",
                color_muntura: "negre",
                preu: 180
            };

            let ulleres = [ulleres1, ulleres2];
            dbo.collection("ulleres").insertMany(ulleres, function (err, res) {
                if (err) throw err;
                console.log("Document inserted");
            })
        });

        dbo.createCollection("clients", function (err, res) {
            if (err) throw err;
            console.log('Coleccio clients creada!');
            let client1 = {
                _id: ObjectId("62a111f783e14e37be84cb35"),
                nom: "Joan",
                cognom1: "Borges",
                cognom2: "Pi",
                adreça: "Rue de Paris,12,5,1,Paris,34350,França",
                client_recomanat: ObjectId("62a111f783e14e37be84c35f"),
                empleat: ObjectId("62a4431383e14e37be84cb35")
            };

            let client2 = {
                _id: ObjectId("62a111f783e14e37be84c35f"),
                nom: "Paula",
                cognom1: "Reta",
                cognom2: "Polir",
                adreça: "Carrer Diagonal',523,6,2,'Barcelona',08021,'Espanya",
                client_recomanat: ObjectId("62a111f783e14e37be84cb35"),
                empleat: ObjectId("62a4431383e14e37be84cb35")
            };

            let clients = [client1, client2];
            dbo.collection("clients").insertMany(clients, function (err, res) {
                if (err) throw err;
                console.log("Document inserted");
            })
        });

        dbo.createCollection("empleats", function (err, res) {
            if (err) throw err;
            console.log('Coleccio empleats creada!');

            let empleat1 = {
                _id: ObjectId("62a4431383e14e37be84cb35"),
                nom: "Enric",
                cognom1: "Martinez",
                cognom2: "Perez"
            };

            let empleat2 = {
                _id: ObjectId("62a4431483e14e37be84cb35"),
                nom: "Marta",
                cognom1: "Lopez",
                cognom2: "Tena"
            };

            let empleats = [empleat1, empleat2];

            dbo.collection("empleats").insertMany(empleats, function (err, res) {
                if (err) throw err;
                console.log("Document inserted");

            })
        })

    }

    async function insertarDatos() {
        return new Promise(async (resolve, reject) => {
            try {
                dbo.createCollection("proveidors", function (err, res) {
                    if (err) throw err;

                    console.log('Coleccio proveidors creada!');
                    let proveidor1 = {
                        _id: ObjectId("62a066f783e14e37be84cb34"),
                        nom: "Proveidor 1",
                        adreça: "Carrer Lepant,63,3,1,Barcelona,08025,Espanya",
                        telefon: 932450025,
                        fax: 932450026,
                        nif: "591451343X"
                    };
                    let proveidor2 = {
                        _id: ObjectId("62a066f783e14e37be84cb35"),
                        nom: "Proveidor 2",
                        adreça: "Carrer Diagonal',523,6,2,'Barcelona',08021,'Espanya",
                        telefon: 9324344025,
                        fax: 9324430026,
                        nif: "591434333A"
                    };
                    let proveidors = [proveidor1, proveidor2];
                    dbo.collection("proveidors").insertMany(proveidors);
                    console.log("1 document inserted");
                });

                dbo.createCollection("ulleres", function (err, res) {
                    if (err) throw err;
                    console.log('Coleccio ulleres creada!');
                    let ulleres1 = {
                        proveidor: ObjectId("62a066f783e14e37be84cb35"),
                        marca: "Gucci",
                        graduacio_dreta: 1.3,
                        graduacio_esquerra: 1.6,
                        tipus_muntura: "pasta",
                        color_muntura: "verd",
                        preu: 300
                    };
        
                    let ulleres2 = {
                        proveidor: ObjectId("62a066f783e14e37be84cb34"),
                        marca: "Rayban",
                        graduacio_dreta: 1.1,
                        graduacio_esquerra: 1.2,
                        tipus_muntura: "flotant",
                        color_muntura: "negre",
                        preu: 180
                    };
        
                    let ulleres = [ulleres1, ulleres2];
                    dbo.collection("ulleres").insertMany(ulleres, function (err, res) {
                        if (err) throw err;
                        console.log("Document inserted");
                    })
                });

            } catch (e) {
                console.log(e);
            }
        })
    }

    insertarDatos();

})