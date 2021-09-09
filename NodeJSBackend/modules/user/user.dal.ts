import { User } from './../../database/models/user.model';
import { fsBucket } from '../../database/grid_fs/fs';
import { Console } from 'console';

export const userDal = {

    profilePageDetails: async (id: Number) => {
        return await User.aggregate()
            .match({ _id: id })
            .project({
                name: 1,
                handle: 1,
                joinDate: 1,
                bio: 1,
                profileImageId: 1,
                headerImageId: 1,
                followers: { $size: "$followers" },
                following: { $size: "$following" }
            })
    },

    profileImage: async (id: Number) => {
        return await fsBucket.openDownloadStreamByName('1' + String(id));
    },

    headerImage: async (id: Number) => {
        return fsBucket.openDownloadStreamByName('2' + String(id));
    }
}