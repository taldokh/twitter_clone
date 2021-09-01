import { posts, users } from '../../data'
import { Post } from './../../database/models/post.model'

export const postDal = {

    homeWall: async (id: Number) => {
        return await Post.find({})
    },

    profiePage: async (id: Number) => {
        return await Post.find({});
    }
}