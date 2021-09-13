import { postDal } from './post.dal';
import { userService } from '../user/user.service';

export const postService = {

    homewall: async (id: string) => {
        const postsIds = (await userService.followingUsersPostsIds(id));
        postsIds.push(...(await userService.postsIds(id)));
        return await postDal.homewall(postsIds);
    },

    profilePage: async (id: string) => {
        const postsIds = (await userService.postsIds(id));
        return await postDal.profilePage(postsIds);
    },

    postImage: async (id: string) => {
        return await postDal.postImage(id);
    },

    like: async (userID: string, postID: string) => {
        return await postDal.like(parseInt(userID), parseInt(postID));
    },

    unlike: async (userID: string, postID: string) => {
        return await postDal.unlike(parseInt(userID), parseInt(postID));
    },
}