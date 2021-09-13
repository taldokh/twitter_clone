import { postDal } from './post.dal';
import { userService } from '../user/user.service';

export const postService = {

    homewall: async (id: string) => {
        const postIds = (await userService.followingUsersPostsIds(id));
        postIds.push(...(await userService.postsIds(id)));
        return await postDal.homewall(postIds);
    },

    profilePage: async (id: string) => {
        return await postDal.profilePage(parseInt(id));
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