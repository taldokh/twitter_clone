"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.userController = void 0;
var express = require("express");
var userController = express.Router();
exports.userController = userController;
userController.get('/profile_page_details/:id', function (req, res) {
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
userController.get('/profile_image/:id', function (req, res) {
    res.send('user avatar image');
});
userController.get('/header_image/:id', function (req, res) {
    res.send('user avatar image');
});
