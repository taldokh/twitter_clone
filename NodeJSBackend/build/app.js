"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var modules_index_1 = require("./modules/modules.index");
var express = require('express');
var mongoClient = require('mongodb').MongoClient;
var uri = 'mongodb://localhost:27017/';
var app = express();
var port = 3000;
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
    console.log(mongoClient);
    new mongoClient().getDB("ta");
});
app.use('/post', modules_index_1.postController);
app.use('/user', modules_index_1.userController);
app.listen(port, function () {
    console.log("Example app listening at http://localhost:" + port);
    mongoClient.connect(uri, function (err, db) {
    });
});
