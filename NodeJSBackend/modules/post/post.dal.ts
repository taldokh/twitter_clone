import { Post } from './../../database/models/post.model'
import { fsBucket } from '../../database/grid_fs/fs';

export const postDal = {

    homewall: async (postsIDs: number[], userId: number) => {
        return await Post.aggregate()
            .match({ '_id': { $in: postsIDs } })
            .project({
                userId: 1,
                content: 1,
                uploadTime: 1,
                commentsCount: { $size: "$comments" },
                likesCount: { $size: "$likes" },
                didLike: { $in: [userId, "$likes"] }
            });
    },

    profilePage: async (postsIDs: number[], userId: number) => {
        return await Post.aggregate()
            .match({ '_id': { $in: postsIDs } })
            .project({
                userId: 1,
                content: 1,
                uploadTime: 1,
                commentsCount: { $size: "$comments" },
                likesCount: { $size: "$likes" },
                didLike: { $in: [userId, "$likes"] }
            });
    },

    postImage: async (id: string) => {
        return await fsBucket.openDownloadStreamByName(id);
    },

    like: async (userID: number, postID: number) => {
        return await Post.update(
            { _id: postID },
            { $push: { likes: userID } }
        );
    },

    unlike: async (userID: number, postID: number) => {
        return await Post.updateOne(
            { _id: postID },
            { $pull: { likes: { $eq: userID } } }
        );
    }
}