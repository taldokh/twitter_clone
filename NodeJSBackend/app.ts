import { postController, userController } from "./modules/modules.index";
import { User } from './database/models/user.model';
const express = require('express');
const mongoose = require('mongoose');
const mongoClient = require('mongodb').MongoClient;
const uri = 'mongodb://localhost:27017/twitter';
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
});

app.use('/post', postController);

app.use('/user', userController);

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
    mongoose.connect(uri, { useNewUrlParser: true }, async function (err: any, db: any) {
        await mongoose.connection.db.dropDatabase();
        let users = [
            {
                _id: 1,
                password: 'Password1',
                name: "Dwayne Johnson",
                handle: "TheRock",
                email: "therock@gmail.com",
                bio: "CEO Seven Bucks Companies",
                photo: "assets/images/photo1.jpeg",
                headerPhoto: "assets/images/header_photo1.jpg",
                followers: [2],
                following: [2, 3],
                posts: [3],
                joinDate: "February 2011",
                followersCount: '1',
                followingCount: '2'
            },

            {
                _id: 2,
                password: 'Password22',
                name: "Jimmy Kimmel Live",
                handle: "JimmyKimmelLive",
                email: "jimmykimmellive@gmail.com",
                bio: "The official Twitter for Jimmy Kimmel Live with @JimmyKimmel on ABC! We have fun.",
                photo: "assets/images/photo2.jpg",
                headerPhoto: "assets/images/header_photo2.jpg",
                followers: [1, 3],
                following: [1, 3],
                posts: [1, 4],
                joinDate: "April 2009",
                followersCount: '2',
                followingCount: '2'
            },

            {
                _id: 3,
                password: 'Password333',
                name: "Gal Gadot",
                handle: "GalGadot",
                email: "galgadot@gmail.com",
                bio: "",
                photo: "assets/images/photo3.jpg",
                headerPhoto: "assets/images/header_photo3.jpg",
                followers: [1, 2],
                following: [2],
                posts: [2, 5],
                joinDate: "April 2009",
                followersCount: '2',
                followingCount: '1'
            },
        ];
        await User.collection.insertMany(users);
    });
});