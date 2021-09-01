import { postDal } from './post.dal';


export const postService = {

    homeWall: (id: string) => {
        const posts = postDal.homeWall(parseInt(id));
        return posts;
    },

    profilePage: (id: string) => {
        const posts = postDal.homeWall(parseInt(id));
        return posts;
    }
}