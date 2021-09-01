import { User } from './../../database/models/user.model';

export const userDal = {

    profilePageDetails: async (id: Number) => {
        return await User.find({});
    }
}