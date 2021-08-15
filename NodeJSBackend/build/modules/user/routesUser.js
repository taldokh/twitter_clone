"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var express = require("express");
var router = express.Router();
router.get('/profile_page_details/:id', function (req, res) {
    res.send('user details');
});
/*
{
    userName,
    userHandle,
    joinDate,
    bio,
    profileImageId,
    headerImageId
    followers,
    following,
}
*/
router.get('/profile_image/:id', function (req, res) {
    res.send('user avatar image');
});
router.get('/header_image/:id', function (req, res) {
    res.send('user avatar image');
});
