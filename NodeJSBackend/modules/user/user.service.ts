import { userDal } from './user.dal';

export const userService = {

    profilePageDetails: async (id: Number) => {
        return await userDal.profilePageDetails(id);
    },

    profileImage: async (id: Number) => {
        return (await userDal.profileImage(id));
    },

    headerImage: async (id: Number) => {
        return await userDal.headerImage(id);
    }
}