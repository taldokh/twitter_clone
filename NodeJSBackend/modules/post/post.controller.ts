import { postService } from './post.service';
const express = require("express");
const postController = express.Router();

postController.get('/', (req: any, res: any) => {
    res.send('hello');
});

// get the home page wall posts by the logged in user id
postController.get('/home/:id', (req: any, res: any) => {
    res.json(postService.homeWall(req.params.id));
});

/*
{
    postId,
    userId,
    userName,
    userHandle,
    likes,
    comments,
    uploadTime,
    content {
        type,
        backgroundColor,
        imageId
    }
}
*/

// get profile page wall posts by the logged in user id
postController.get('/profile_page/:id', (req: any, res: any) => {
    res.json(postService.homeWall(req.params.id));
});

/*
{
    postId,
    userId,
    userName,
    userHandle,
    likes,
    comments,
    uploadTime,
    content {
        type,
        backgroundColor,
        imageId
    }
}
*/

// get the post image by id ********************** ? *********************
postController.get('/image/:id', (req: any, res: any) => {
    res.send('image');
});

/*
    {
        image
    }
*/

// like a post
postController.put('/like/user_id/:id/post_id/:id', (req: any, res: any) => {
    res.send('liked');
});

// unlike a post
postController.put('/unlike/user_id/:id/post_id/:id', (req: any, res: any) => {
    res.send('unliked');
});


export { postController };