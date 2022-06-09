db.usuaris.drop();
db.usuaris.insertMany([
  {
    _id: ObjectId("62a4431483e14e37be84c99a"),
    nom: "Enric",
    cognom1: "Lopez",
    cognom2: "Perez",
    email: "enriclopez@prova.com",
    password: "dfihiqhrieijfod3293y23_",
    data_naixement: "2022-02-31T23:00:00.000+00:00",
    pais: "France",
    sexe: "M",
    codi_postal: 08021,
    canals_subscrits: [
      ObjectId("62a4431483e14e37be84c991"),
      ObjectId("62a4431483e14e37be84c992"),
    ],
    videos: [
      {
        _id: ObjectId("62a4431483e14e37be84c993"),
        data_hora_creacio: "2022-02-31T23:00:00.000+00:00",
        titol: "Tutorial01",
        descripcio: "Tutorial de nodejs",
        tamany: "300Mb",
        nom_fitxer: "tutorial01_01.mp4",
        durada: "15min",
        thumbnail: "",
        reproduccions: 1350,
        num_likes: 100,
        num_dislikes: 13,
        estat : 'public',
        etiquetes: [
          {
            _id: ObjectId("62a4431483e14e37be84c994"),
            nom: "Tutorials",
          },
        ],
        likes_dislikes: [
            {
                _id : ObjectId("62a4431483e14e37be84c995"),
                usuari : ObjectId("62a4431483e14e37be84c996"),
                data_hora_creacio: "2022-02-31T23:00:00.000+00:00",
                tipus : 'Like'
            },
            {
                _id : ObjectId("62a4431483e14e37be84c997"),
                usuari : ObjectId("62a4431483e14e37be84c998"),
                data_hora_creacio: "2022-02-31T23:00:00.000+00:00",
                tipus : 'Dislike'
            },
        ],
        comentaris : [
            {
                _id : ObjectId("62a4431483e14e37be84c998"),
                usuari :  ObjectId("62a4431483e14e37be84c998"),
                data_hora_creacio: "2022-02-31T23:00:00.000+00:00",
                text : "Aquest video no s'enten",
                likes_dislikes : [
                    {
                        _id : ObjectId("62a4431483e14e37be84c999"),
                        usuari : ObjectId("62a4431483e14e37be84c99a"),
                        data_hora_creacio: "2022-02-31T23:00:00.000+00:00",
                        tipus : 'Dislike'
                    },
                    {
                        _id : ObjectId("62a4431483e14e37be841000"),
                        usuari : ObjectId("62a4431483e14e37be810011"),
                        data_hora_creacio: "2022-02-31T23:00:00.000+00:00",
                        tipus : 'Dislike'
                    },
                ]
            }
        ]
      },
    ],
    canals : [
        {
            _id : ObjectId("62a4431483e14e37be842000"),
            nom : 'Apren Nodejs',
            descripció : 'Canal per apendre Nodejs',
            data_creacio: "2022-02-31T23:00:00.000+00:00",
        }
    ],
    playlists : [
        {
            _id : ObjectId("62a4431483e14e37be842000"),
            nom : 'Videos per veure',
            videos : [
                ObjectId("62a4431483e14e37be84c993"),
                ObjectId("62a4431483e14e37be843000")
            ],
            descripció : 'Video que no he vist encara',
            data_creacio: "2022-02-31T23:00:00.000+00:00", 
            estat : 'Ocult'
        },
        {
            _id : ObjectId("62a4431483e14e37be842000"),
            nom : 'Videos per recomanar',
            videos : [
                ObjectId("62a4431483e14e37be84c551"),
                ObjectId("62a4431483e14e37be843001")
            ],
            descripció : 'Video que he vist i puc recomenar',
            data_creacio: "2022-02-31T23:00:00.000+00:00", 
            estat : 'Public'
        }
    ]
  },
  {
    _id: ObjectId("62a4431483e14e37be84c123"),
    nom: "Laura",
    cognom1: "Mendez",
    cognom2: "Pal",
    email: "lamen@prova.com",
    password: "323fadfa",
    data_naixement: "2022-01-31T23:00:00.000+00:00",
    pais: "Espanya",
    sexe: "F",
    codi_postal: 08023,
    canals_subscrits: [
      ObjectId("62a4431483e14e37be84c991"),
      ObjectId("62a4431483e14e37be84c992"),
    ],
    videos: [
      {
        _id: ObjectId("62a4431483e14e37be84c993"),
        data_hora_creacio: "2022-02-31T23:00:00.000+00:00",
        titol: "Tutorial01",
        descripcio: "Tutorial de nodejs",
        tamany: "300Mb",
        nom_fitxer: "tutorial01_01.mp4",
        durada: "15min",
        thumbnail: "",
        reproduccions: 1350,
        num_likes: 100,
        num_dislikes: 13,
        estat : 'public',
        etiquetes: [
          {
            _id: ObjectId("62a4431483e14e37be84c994"),
            nom: "Tutorials",
          },
        ],
        likes_dislikes: [
            {
                _id : ObjectId("62a4431483e14e37be84c995"),
                usuari : ObjectId("62a4431483e14e37be84c996"),
                data_hora_creacio: "2022-02-31T23:00:00.000+00:00",
                tipus : 'Like'
            },
            {
                _id : ObjectId("62a4431483e14e37be84c997"),
                usuari : ObjectId("62a4431483e14e37be84c998"),
                data_hora_creacio: "2022-02-31T23:00:00.000+00:00",
                tipus : 'Dislike'
            },
        ],
        comentaris : [
            {
                _id : ObjectId("62a4431483e14e37be84c998"),
                usuari :  ObjectId("62a4431483e14e37be84c998"),
                data_hora_creacio: "2022-02-31T23:00:00.000+00:00",
                text : "Aquest video no s'enten",
                likes_dislikes : [
                    {
                        _id : ObjectId("62a4431483e14e37be84c999"),
                        usuari : ObjectId("62a4431483e14e37be84c99a"),
                        data_hora_creacio: "2022-02-31T23:00:00.000+00:00",
                        tipus : 'Dislike'
                    },
                    {
                        _id : ObjectId("62a4431483e14e37be841000"),
                        usuari : ObjectId("62a4431483e14e37be810011"),
                        data_hora_creacio: "2022-02-31T23:00:00.000+00:00",
                        tipus : 'Dislike'
                    },
                ]
            }
        ]
      },
    ],
    canals : [
        {
            _id : ObjectId("62a4431483e14e37be842000"),
            nom : 'Apren Nodejs',
            descripció : 'Canal per apendre Nodejs',
            data_creacio: "2022-02-31T23:00:00.000+00:00",
        }
    ],
    playlists : [
        {
            _id : ObjectId("62a4431483e14e37be842000"),
            nom : 'Videos per veure',
            videos : [
                ObjectId("62a4431483e14e37be84c993"),
                ObjectId("62a4431483e14e37be843000")
            ],
            descripció : 'Video que no he vist encara',
            data_creacio: "2022-02-31T23:00:00.000+00:00", 
            estat : 'Ocult'
        },
        {
            _id : ObjectId("62a4431483e14e37be842000"),
            nom : 'Videos per recomanar',
            videos : [
                ObjectId("62a4431483e14e37be84c551"),
                ObjectId("62a4431483e14e37be843001")
            ],
            descripció : 'Video que he vist i puc recomenar',
            data_creacio: "2022-02-31T23:00:00.000+00:00", 
            estat : 'Public'
        }
    ]
  }
]);
