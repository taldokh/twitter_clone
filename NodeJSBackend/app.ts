import { postController, userController } from "./modules/modules.index";
import { User } from './database/models/user.model';
import { Post } from './database/models/post.model';
import { initFSBucket, fsBucket } from "./database/grid_fs/fs";
import { TextContent } from './classes/text_content'
import { ImageAndTextContent } from './classes/image_and_text_content'
import { ImageContent } from './classes/image_content'
const fs = require('fs');
const express = require('express');
const mongoose = require('mongoose');
const uri = 'mongodb://twitter_mongodb:27017/twitter';
const app = express();
const port = 3000;

app.get('/', (_req: any, res: any) => {
    res.send('hello world');
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
                profileImageId: 1,
                headerImageId: 1,
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
                profileImageId: 2,
                headerImageId: 2,
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
                profileImageId: 3,
                headerImageId: 3,
                followers: [1, 2],
                following: [2],
                posts: [2, 5],
                joinDate: "April 2009"
            },
        ];

        const posts = [
            {
                _id: 1,
                userId: 2,
                content: new TextContent(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                likes: [1, 3],
                comments: [],
                uploadTime: '17h'
            },

            {
                _id: 2,
                userId: 3,
                content: new ImageAndTextContent(
                    2,
                    'Took some time off and spent it at my favorite place, the sound of the waves, the smell of the ocean, the sand in my toes, those always make me calmer, happier and ready for anything...'),
                likes: [1, 3],
                comments: [],
                uploadTime: '22h'
            },

            {
                _id: 3,
                userId: 1,
                content: new ImageAndTextContent(
                    1,
                    'It’s time to level up. \nClick to shop the latest collection: http://projectrock.online/tpp\n#ThroughTheWork\n#ProjectRock\n@TheRock'),
                likes: [3],
                comments: [],
                uploadTime: 'Jun 1'
            },
            {
                _id: 4,
                userId: 2,
                content: new TextContent(
                    'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
                likes: [1],
                comments: [],
                uploadTime: 'May 20'
            },
            {
                _id: 5,
                userId: 3,
                content: new ImageContent(
                    3)
                , likes: [1, 2],
                comments: [],
                uploadTime: 'Apr 8'
            },
        ];

        console.log((posts[0].content as TextContent).type);

        await User.collection.insertMany(users);

        await Post.collection.insertMany(posts);

        fs.createReadStream('./assets/photo1.jpeg').pipe(fsBucket.openUploadStream('11'));
        fs.createReadStream('./assets/photo2.jpg').pipe(fsBucket.openUploadStream('12'));
        fs.createReadStream('./assets/photo3.jpg').pipe(fsBucket.openUploadStream('13'));
        fs.createReadStream('./assets/header_photo1.jpg').pipe(fsBucket.openUploadStream('21'));
        fs.createReadStream('./assets/header_photo2.jpg').pipe(fsBucket.openUploadStream('22'));
        fs.createReadStream('./assets/header_photo3.jpg').pipe(fsBucket.openUploadStream('23'));
        fs.createReadStream('./assets/post_image11.jpg').pipe(fsBucket.openUploadStream('1'));
        fs.createReadStream('./assets/post_image31.jpg').pipe(fsBucket.openUploadStream('2'));
        fs.createReadStream('./assets/post_image32.jpg').pipe(fsBucket.openUploadStream('3'));
    });
});