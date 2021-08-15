const postDal = require('./dalPost');

export const postService = {

    homeWall: (id: string) => {
        const posts = postDal.homeWall(parseInt(id));
        return posts;
    }
}