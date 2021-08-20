import { userService } from './user.service';
const express = require("express");
const router = express.Router();

router.get('/profile_page_details/:id', (req: any, res: any) => {
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

router.get('/profile_image/:id', (req: any, res: any) => {
    res.send('user avatar image');
});

router.get('/header_image/:id', (req: any, res: any) => {
    res.send('user avatar image');
});

module.exports = router;