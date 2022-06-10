db.artistes.drop();
db.artistes.insertMany([
    {
        _id :  ObjectId("62a4431483e14e37be842000"),
        nom : 'David Guetta',
        imatge : '',
        etiqueta : ['Disco', 'Techno'],
        album : [
            {
                _id : ObjectId('62a4431483e14e37be842001'),
                nom : "Fck me I'm famous",
                any_publicacio : 2001,
                imatge : '',
                cançons : [
                    {
                        _id : ObjectId('62a4431483e14e37be842002'),
                        titol : "Just for One Day (Heroes)",
                        durada : '03:40',
                        num_reproduccions : 13273676,
                    },
                    {
                        _id : ObjectId('62a4431483e14e37be842003'),
                        titol : "Shout",
                        durada : '02:40',
                        num_reproduccions : 1514643,
                    },
                    {
                        _id : ObjectId('62a4431483e14e37be842004'),
                        titol : "Fuckin' Track",
                        durada : '02:30',
                        num_reproduccions : 71346,
                    },
                    {
                        _id : ObjectId('62a4431483e14e37be842005'),
                        titol : "Satisfaction",
                        durada : '04:10',
                        num_reproduccions : 71664346,
                    },
                ]
            }
        ]
    },
    {
        _id :  ObjectId("62a4431483e14e37be843000"),
        nom : 'The strokes',
        imatge : '',
        etiqueta : ['Rock'],
        album : [
            {
                _id : ObjectId('62a4431483e14e37be832001'),
                nom : "Comedown Machine",
                any_publicacio : 2015,
                imatge : '',
                cançons : [
                    {
                        _id : ObjectId('62a4431483e14e37be812002'),
                        titol : "Tap Out",
                        durada : '03:40',
                        num_reproduccions : 13273676,
                    },
                    {
                        _id : ObjectId('62a4431483e14e37b2842003'),
                        titol : "All the Time",
                        durada : '02:40',
                        num_reproduccions : 1514643,
                    }
                ]
            }
        ]
    }
])

db.usuaris.drop();
db.usuaris.insertMany([
    {
        _id : ObjectId('62a4431483e14e37be842006'),
        nom : "franba",
        email : "francb@prova.com",
        password : "1234",
        data_naixement : "2022-02-31",
        pais : "Espanya",
        sexe : "M",
        codi_postal : 080025,
        artistes : [
            ObjectId("62a4431483e14e37be842000"),
        ],
        album : [
            ObjectId('62a4431483e14e37be842001'),
        ],
        cançons : [
            ObjectId('62a4431483e14e37be842004'),
            ObjectId('62a4431483e14e37be842005')
        ],
        playlists : [
            ObjectId('62a4431483e14e37be842100'),
        ]
    },
    {
        _id : ObjectId('62a4431483e14e37be842008'),
        nom : "ana234",
        email : "abba@prova.com",
        password : "12345",
        data_naixement : "2021-02-31",
        pais : "Espanya",
        sexe : "F",
        codi_postal : 080021,
        artistes : [
           
        ],
        album : [
            ObjectId('62a4431483e14e37be842001'),
            ObjectId('62a4431483e14e37be832001')
        ],
        cançons : [
            ObjectId('62a4431483e14e37be842004'),
            ObjectId('62a4431483e14e37b2842003'),
        ],
        playlists : [
            ObjectId('62a4431483e14e37be842100'),
        ]
    }
])

db.playlists.drop();
db.playlists.insertMany([
    {
        _id : ObjectId('62a4431483e14e37be842100'),
        titol : 'Disco Ibiza 2001',
        data_hora : "2022-02-31T23:00:00.000+00:00",
        estat : 'publica',
        data_elimanada : '',
        usuari_creador : ObjectId("62a4431483e14e37be842000"),
        cançons_afegides : [
            {
                usuari_afegidor : ObjectId("62a4431483e14e37be842000"),
                canço : ObjectId('62a4431483e14e37be842004'),
                data_hora : "2022-02-31T23:00:00.000+00:00",
            },
            {
                usuari_afegidor : ObjectId('62a4431483e14e37be842008'),
                canço : ObjectId('62a4431483e14e37be842002'),
                data_hora : "2022-02-31T23:00:00.000+00:00",
            },
        ]
    }
])