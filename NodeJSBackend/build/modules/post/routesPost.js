"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var servicePost_1 = require("./servicePost");
var express = require("express");
var router = express.Router();
router.get('/', function (req, res) {
    res.send('hello');
});
// get the home page wall posts by the logged in user id
router.get('/home/:id', function (req, res) {
    res.json(servicePost_1.postService.homeWall(req.params.id));
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
router.get('/profile_page/:id', function (req, res) {
    res.json(servicePost_1.postService.homeWall(req.params.id));
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
router.get('/image/:id', function (req, res) {
    res.send('image');
});
/*
    {
        image
    }
*/
// like a post
router.put('/like/user_id/:id/post_id/:id', function (req, res) {
    res.send('liked');
});
// unlike a post
router.put('/unlike/user_id/:id/post_id/:id', function (req, res) {
    res.send('unliked');
});
module.exports = router;
