import { userDal } from './user.dal';

export const userService = {

    profilePageDetails: async (id: Number) => {
        return await userDal.profilePageDetails(id);
    }
}