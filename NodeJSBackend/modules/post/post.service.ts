import { postDal } from './post.dal';


export const postService = {

    homeWall: async (id: string) => {
        return await postDal.homeWall(parseInt(id));
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