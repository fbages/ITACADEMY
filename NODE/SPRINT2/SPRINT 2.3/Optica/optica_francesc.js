db.proveidors.drop();
db.proveidors.insertMany([{
    _id: ObjectId("62a066f783e14e37be84cb72"),
    nom: "Proveidor 1",
    adreça: "Carrer Lepant,63,3,1,Barcelona,08025,Espanya",
    telefon: 932450025,
    fax: 932450026,
    nif: "591451343X"
},
{
    _id: ObjectId("62a066f783e14e37be84cb74"),
    nom: "Proveidor 2",
    adreça: "Carrer Diagonal',523,6,2,'Barcelona',08021,'Espanya",
    telefon: 9324344025,
    fax: 9324430026,
    nif: "591434333A"
}]
);
db.ulleres.drop();
db.ulleres.insertMany([
    {
        _id: ObjectId("62a066f783e14e37be84cb11"),
        proveidor_id: ObjectId("62a066f783e14e37be84cb72"),
        marca: "Gucci",
        graduacio_dreta: 1.3,
        graduacio_esquerra: 1.6,
        tipus_muntura: "pasta",
        color_muntura: "verd",
        preu: 300
    },

    {
        _id: ObjectId("62a066f783e14e37be843374"),
        proveidor_id: ObjectId("62a066f783e14e37be84cb72"),
        marca: "Rayban",
        graduacio_dreta: 1.1,
        graduacio_esquerra: 1.2,
        tipus_muntura: "flotant",
        color_muntura: "negre",
        preu: 180
    }]
);
db.clients.drop();
db.clients.insertMany([
    {
        _id: ObjectId("62a111f783e14e37be84cb99"),
        nom: "Joan",
        cognom1: "Borges",
        cognom2: "Pi",
        adreça: "Rue de Paris,12,5,1,Paris,34350,França",
        client_recomanat: ObjectId("62a111f783e14e37be84c35f"),
        empleat: ObjectId("62a4431383e14e37be84cb35"),
        compra : ObjectId("62a066f783e14e37be84cb11")
    },

    {
        _id: ObjectId("62a111f783e14e37be84c099"),
        nom: "Paula",
        cognom1: "Reta",
        cognom2: "Polir",
        adreça: "Carrer Diagonal',523,6,2,'Barcelona',08021,'Espanya",
        client_recomanat: ObjectId("62a111f783e14e37be84cb35"),
        empleat: ObjectId("62a4431383e14e37be84cb35"),
        compra : ObjectId("62a066f783e14e37be84cb11")
    }]
);
db.empleats.drop();
db.empleats.insertMany([
    {
        _id: ObjectId("62a4431383e14e37be84cb35"),
        nom: "Enric",
        cognom1: "Martinez",
        cognom2: "Perez"
    },

    {
        _id: ObjectId("62a4431483e14e37be84cb35"),
        nom: "Marta",
        cognom1: "Lopez",
        cognom2: "Tenas"
    }
]
)