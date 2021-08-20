"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.postController = void 0;
var post_service_1 = require("./post.service");
var express = require("express");
var postController = express.Router();
exports.postController = postController;
postController.get('/', function (req, res) {
    res.send('hello');
});
// get the home page wall posts by the logged in user id
postController.get('/home/:id', function (req, res) {
    res.json(post_service_1.postService.homeWall(req.params.id));
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
postController.get('/profile_page/:id', function (req, res) {
    res.json(post_service_1.postService.homeWall(req.params.id));
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
postController.get('/image/:id', function (req, res) {
    res.send('image');
});
/*
    {
        image
    }
*/
// like a post
postController.put('/like/user_id/:id/post_id/:id', function (req, res) {
    res.send('liked');
});
// unlike a post
postController.put('/unlike/user_id/:id/post_id/:id', function (req, res) {
    res.send('unliked');
});
