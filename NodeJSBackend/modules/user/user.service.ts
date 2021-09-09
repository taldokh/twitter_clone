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

    postsIdsOfFollowingUsers: async (id: string) => {
        return (await userDal.postsIdsOfFollowingUsers(parseInt(id)))[0].posts;
    },
}