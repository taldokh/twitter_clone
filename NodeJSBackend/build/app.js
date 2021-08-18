"use strict";
var express = require('express');
// const mongoClient = require('mongodb').MongoClient;
// const uri = 'mongodb://localhost:27017/';
var app = express();
var port = 3000;
var postRoutes = require('./modules/post/routesPost');
var userRoutes = require('./modules/user/routesUser');
// mongoClient.connect(url, function (err: any, db: any) {
//     if (err) throw err;
//     console.log("Database created!");
//     const dbo = db.db("tal");
//     dbo.collection("movies").insertOne({
//         title: "The Favourite",
//         geners: ["Drama", "History"],
//         runtime: 121
//     }, (err: any, res: any) => {
//         if (err) console.log(err);
//         console.log(res)
//         console.log('Document created!');
//         db.close();
//     }
//     )
// });
app.get('/', function (_req, res) {
    res.send('hello world');
});
app.use('/post', postRoutes);
app.use('/user', userRoutes);
app.listen(port, function () {
    console.log("Example app listening at http://localhost:" + port);
});
