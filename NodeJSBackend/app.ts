import { postController, userController } from "./modules/modules.index";
import { User } from './database/models/user.model';
import { initFSBucket, fsBucket } from "./database/grid_fs/fs";
const fs = require('fs');
const express = require('express');
const mongoose = require('mongoose');
const uri = 'mongodb://localhost:27017/twitter';
const app = express();
const port = 3000;

app.get('/', (_req: any, res: any) => {
    //res.send('hello world');
    fsBucket.openDownloadStreamByName('22').pipe(res);
});

app.use('/post', postController);

app.use('/user', userController);

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
    mongoose.connect(uri, { useNewUrlParser: true }, async function (err: any, db: any) {
        await mongoose.connection.db.dropDatabase();
        initFSBucket(mongoose.connection.db);
        const users = [
            {
                _id: 1,
                password: 'Password1',
                name: "Dwayne Johnson",
                handle: "TheRock",
                email: "therock@gmail.com",
                bio: "CEO Seven Bucks Companies",
                profileImageId: 11,
                headerImageId: 21,
                followers: [2],
                following: [2, 3],
                posts: [3],
                joinDate: "February 2011"
            },

            {
                _id: 2,
                password: 'Password22',
                name: "Jimmy Kimmel Live",
                handle: "JimmyKimmelLive",
                email: "jimmykimmellive@gmail.com",
                bio: "The official Twitter for Jimmy Kimmel Live with @JimmyKimmel on ABC! We have fun.",
                profileImageId: 12,
                headerImageId: 22,
                followers: [1, 3],
                following: [1, 3],
                posts: [1, 4],
                joinDate: "April 2009"
            },

            {
                _id: 3,
                password: 'Password333',
                name: "Gal Gadot",
                handle: "GalGadot",
                email: "galgadot@gmail.com",
                bio: "",
                profileImageId: 13,
                headerImageId: 23,
                followers: [1, 2],
                following: [2],
                posts: [2, 5],
                joinDate: "April 2009"
            },
        ];

        await User.collection.insertMany(users);

        fs.createReadStream('./assets/photo1.jpeg').pipe(fsBucket.openUploadStream('11'));
        fs.createReadStream('./assets/photo2.jpg').pipe(fsBucket.openUploadStream('12'));
        fs.createReadStream('./assets/photo3.jpg').pipe(fsBucket.openUploadStream('13'));
        fs.createReadStream('./assets/header_photo1.jpg').pipe(fsBucket.openUploadStream('21'));
        fs.createReadStream('./assets/header_photo2.jpg').pipe(fsBucket.openUploadStream('22'));
        fs.createReadStream('./assets/header_photo3.jpg').pipe(fsBucket.openUploadStream('23'));
    });
});