import { User } from './../../database/models/user.model';
import { fsBucket } from '../../database/grid_fs/fs';

export const userDal = {

    followingList: async (id: number) => {
        return await User.findById(id, { 'following': 1, '_id': 0 });
    },

    postsIdsOfFollowingUsers: async (id: number) => {
        return await User.aggregate([
            { $match: { '_id': { $in: (await userDal.followingList(id)).following } } },
            { $unwind: "$posts" },
            { $group: { _id: null, posts: { $push: "$posts" } } },
            { $project: { _id: 0, posts: "$posts" } }
        ]);
    },

    profilePageDetails: async (id: number) => {
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

    postHeader: async (id: number) => {
        return await User.findById(id, { 'name': 1, 'handle': 1, '_id': 0 });
    },

    // followingList: async (id: number) => {
    //     return await User.findById(id).select('following');
    // },

    // followingUsersPostsIDs: async (postIDs: number[]) => {
    //     return await User.findById(id).aggregate()
    //     .match({ _id: id })
    //     .project({
    //         name: 1,
    //         handle: 1,
    //         joinDate: 1,
    //         bio: 1,
    //         profileImageId: 1,
    //         headerImageId: 1,
    //         followers: { $size: "$followers" },
    //         following: { $size: "$following" }
    //     });
    // } 
}