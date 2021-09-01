import { userService } from './user.service';
const express = require("express");
const userController = express.Router();

userController.get('/profile_page_details/:id', async (req: any, res: any) => {
    res.json(await userService.profilePageDetails(req.params.id));
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

userController.get('/profile_image/:id', (req: any, res: any) => {
    res.send('user avatar image');
});

userController.get('/header_image/:id', (req: any, res: any) => {
    res.send('user avatar image');
});

export { userController };