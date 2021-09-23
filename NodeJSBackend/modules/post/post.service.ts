import { postDal } from './post.dal';
import { userService } from '../user/user.service';

export const postService = {

    homewall: async (id: string) => {
        const postsIds = (await userService.followingUsersPostsIds(id));
        postsIds.push(...(await userService.postsIds(id)));
        return await Promise.all((await postDal.homewall(postsIds, parseInt(id))).map(postService.mergePostWithHeaderDetails));
    },

    profilePage: async (id: string) => {
        const postsIds = (await userService.postsIds(id));
        return await Promise.all((await postDal.profilePage(postsIds, parseInt(id))).map(postService.mergePostWithHeaderDetails));
    },

    mergePostWithHeaderDetails: async (post: any) => ({ ...post, ...(await userService.postHeader(post.userId)) }),

    postImage: async (id: string) => await postDal.postImage(id),

    like: async (userID: string, postID: string) => await postDal.like(parseInt(userID), parseInt(postID)),

    unlike: async (userID: string, postID: string) => await postDal.unlike(parseInt(userID), parseInt(postID))

}