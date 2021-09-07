import { nextTick } from 'process';
import { userService } from './user.service';
const express = require("express");
const userController = express.Router();

userController.get('/profile_page_details/:id', async (req: any, res: any, next: any) => {
    res.json(await userService.profilePageDetails(req.params.id));
});

userController.get('/profile_image/:id', async (req: any, res: any, next: any) => {
    (await userService.profileImage(req.params.id)).pipe(res)
});

userController.get('/header_image/:id', async (req: any, res: any) => {
    (await userService.headerImage(req.params.id)).pipe(res);
});

userController.get('*', (req: any, res: any) => {
    res.send('404');
});

export { userController };