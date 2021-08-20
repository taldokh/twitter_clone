import { postController, userController } from "./modules/modules.index";
const express = require('express');
const mongoClient = require('mongodb').MongoClient;
const uri = 'mongodb://localhost:27017/';
const app = express();
const port = 3000;

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

app.get('/', (_req: any, res: any) => {
    res.send('hello world');
    console.log(mongoClient);
    new mongoClient().getDB("ta");
});

app.use('/post', postController);

app.use('/user', userController);

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
    mongoClient.connect(uri, function (err: any, db: any) {
    });
});