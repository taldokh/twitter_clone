import { userDal } from './user.dal';

export const userService = {

    profilePageDetails: async (id: string) => {
        return await userDal.profilePageDetails(parseInt(id));
    },

    profileImage: async (id: string) => {
        return (await userDal.profileImage(id));
    },

    headerImage: async (id: string) => {
        return await userDal.headerImage(id);
    },

    postHeader: async (id: string) => {
        return await userDal.postHeader(parseInt(id));
    },

    followingUsersPostsIds: async (id: string) => {
        return (await userDal.followingUsersPostsIds(parseInt(id)))[0].posts;
    },

    postsIds: async (id: string) => {
        return (await userDal.postsIds(parseInt(id))).posts;
    },
}