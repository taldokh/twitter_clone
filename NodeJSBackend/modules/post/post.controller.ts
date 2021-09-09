import { postService } from './post.service';
const express = require("express");
const postController = express.Router();

postController.get('/home/:id', async (req: any, res: any) => {
    res.json(await postService.homewall(req.params.id));
});
/*
{
    postId,
    userId,
        userName,
        userHandle,
        profileImage,
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
postController.get('/profile_page/:id', async (req: any, res: any) => {
    res.json(await postService.profilePage(req.params.id));
});

/*
{
    postId,
    userId,
        userName,
        userHandle,
        profileImage
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
postController.get('/image/:id', async (req: any, res: any) => {
    (await postService.postImage(req.params.id)).pipe(res);
});

// like a post
postController.put('/like/user_id/:userID/post_id/:postID', async (req: any, res: any) => {
    res.json(await postService.like(req.params.userID, req.params.postID));
});

// unlike a post
postController.put('/unlike/user_id/:userID/post_id/:postID', async (req: any, res: any) => {
    res.json(await postService.unlike(req.params.userID, req.params.postID));
});

postController.get('*', (req: any, res: any) => {
    res.send('404');
});

export { postController };