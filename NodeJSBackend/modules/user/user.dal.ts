import { User } from './../../database/models/user.model';
import { fsBucket } from '../../database/grid_fs/fs';

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
            });
    },

    profileImage: async (id: string) => {
        return await fsBucket.openDownloadStreamByName('1' + id);
    },

    headerImage: async (id: string) => {
        return fsBucket.openDownloadStreamByName('2' + id);
    },

    postHeader: async (id: Number) => {
        return await User.findById(id).select('name handle');
    },

    followingList: async (id: Number) => {
        return await User.findById(id).select('following');
    }
}