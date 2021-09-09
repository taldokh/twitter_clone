import { userDal } from './user.dal';

export const userService = {

    profilePageDetails: async (id: string) => {
        return await userDal.profilePageDetails(Number(id));
    },

    profileImage: async (id: string) => {
        return (await userDal.profileImage(id));
    },

    headerImage: async (id: string) => {
        return await userDal.headerImage(id);
    },

    postHeader: async (id: Number) => {
        return await userDal.postHeader(id);
    },

    followingList: async (id: Number) => {
        return await userDal.followingList(id);
    }
}