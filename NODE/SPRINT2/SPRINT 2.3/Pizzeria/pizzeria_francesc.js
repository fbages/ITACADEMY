db.productes.drop();
db.productes.insertMany([
    {
        _id : ObjectId('62a4431483e14e37be84c99a'),
        tipus : 'Pizza petita',
        nom : 'Margarita',
        descripcio : 'Tomaquet, mozzarela i oregan',
        imatge : '',
        preu : 7
    },
    {
        _id : ObjectId('62a4431483e14e37be84c99b'),
        tipus : 'Pizza mitjana',
        nom : 'Margarita',
        descripcio : 'Tomaquet, mozzarela i oregan',
        imatge : '',
        preu : 9
    },
    {
        _id : ObjectId('62a4431483e14e37be84c99c'),
        tipus : 'Pizza gran',
        nom : 'Margarita',
        descripcio : 'Tomaquet, mozzarela i oregan',
        imatge : '',
        preu : 12
    },
    {
        _id : ObjectId('62a4431483e14e37be84c99d'),
        tipus : 'Hamburguesa',
        nom : 'BBQ',
        descripcio : 'Carn, baicon i ceba',
        imatge : '',
        preu : 10
    },
    {
        _id : ObjectId('62a4431483e14e37be84c99e'),
        tipus : 'Beguda',
        nom : 'Cocacola',
        descripcio : '33cl',
        imatge : '',
        preu : 3
    },
]);

db.empleats.drop();
db.empleats.insertMany([
    {
        _id : ObjectId('62a4431483e14e37be84c991'),
        tipus : 'Cuiner',
        nom : 'Lluis',
        cognom1 : 'Pera',
        cognom2 : 'Martinez',
        comandas : [
            ObjectId('53a4431483e14e37be84c991'),
            ObjectId('52a4431483e14e37be84c991'),
        ]
    },
    {
        _id : ObjectId('62a4431483e14e37be84c992'),
        tipus : 'Repartidor',
        nom : 'Enric',
        cognom1 : 'Pi',
        cognom2 : 'Lopez',
        comandas : [
            ObjectId('52a4431483e14e37be84c991'),
        ]
    },
    {
        _id : ObjectId('62a4431483e14e37be84c911'),
        tipus : 'Cuiner',
        nom : 'Pau',
        cognom1 : 'Poma',
        cognom2 : 'Martinez',
        comandas : [

        ]
    },
    {
        _id : ObjectId('62a4431483e14e37be84c997'),
        tipus : 'Repartidor',
        nom : 'Laura',
        cognom1 : 'Coma',
        cognom2 : 'Tau',
        comandas : [

        ]
    }
]);

db.botigues.drop();
db.botigues.insertMany([
    {
        _id :  ObjectId('62a4411483e14e37be84c991'),
        adreça : '',
        codiPostal : 08021,
        localita : 'Barcelona',
        provincia : 'Barcelona',
        empleats : [
            ObjectId('62a4431483e14e37be84c991'),
            ObjectId('62a4431483e14e37be84c992')
        ],
        comandes : [
            ObjectId('53a4431483e14e37be84c991'),
            ObjectId('52a4431483e14e37be84c991')
        ]
    },
    {
        _id : ObjectId('62a4442483e14e37be84c991'),
        adreça : '',
        codiPostal : 08023,
        localita : 'Badalona',
        provincia : 'Barcelona',
        empleats : [
            ObjectId('62a4431483e14e37be84c991'),
            ObjectId('62a4431483e14e37be84c992')
        ],
        comandes : [
            ObjectId('53a4431483e14e37be84c991'),
            ObjectId('52a4431483e14e37be84c991')
        ]
    }
])

db.clients.drop();
db.clients.insertMany([
    {
        nom : 'Marc',
        cognom1 : 'Pita',
        cognom2 : 'Muller',
        Adreça : '',
        codiPostal : 08022,
        localitat : 'Barcelona',
        provincia : 'Barcelona',
        telefon : 645434123,
        comandes : [
            {
                _id : ObjectId('52a4431483e14e37be84c991'),
                dataHora : '2022-02-31T23:00:00.000+00:00',
                tipusComanda : 'Recollir',
                productes : [
                    ObjectId('62a4431483e14e37be84c99d'),
                    ObjectId('62a4431483e14e37be84c99e')
                ],
                quantitat : [
                    1,
                    2
                ],
                preu : [
                    10,
                    6
                ]

            }
    ]
    },
    {
        nom : 'Lolita',
        cognom1 : 'Sanchez',
        cognom2 : 'Calvo',
        Adreça : '',
        codiPostal : 08021,
        localitat : 'Barcelona',
        provincia : 'Barcelona',
        telefon : 645434153,
        comandes : [
            {
                _id : ObjectId('53a4431483e14e37be84c991'),
                dataHora : '2022-03-31T23:00:00.000+00:00',
                tipusComanda : 'Entrega domicili',
                productes : [
                    ObjectId('62a4431483e14e37be84c99d'),
                    ObjectId('62a4431483e14e37be84c99b'),
                    ObjectId('62a4431483e14e37be84c99e')
                ],
                quantitat : [
                    3,
                    1,
                    5
                ],
                preu : [
                    27,
                    10,
                    15
                ]

            }
    ]
    }
])