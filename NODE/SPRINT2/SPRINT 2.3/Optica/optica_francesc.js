let MongoClient = require('mongodb').MongoClient;
let url = "mongodb://localhost:27017/";

MongoClient.connect(url, function(err, db){
    if(err) throw err;
    console.log('Base de dades optica_francesc creada');
    
    var dbo = db.db("optica_francesc");
    dbo.dropDatabase();
    dbo = db.db("optica_francesc");
    
    dbo.createCollection("proveidors", function(err, res){
        if(err) throw err;
        console.log('Coleccio proveidors creada!');
        var myobj = { name: "Company Inc", address: "Highway 37" };
        dbo.collection("proveidors").insertOne(myobj, function(err, res) {
            if (err) throw err;
            console.log("1 document inserted");
            db.close();
    });
    
})
    
})