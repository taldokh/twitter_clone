import { Content } from './content';

export class Post {

    constructor(postId: number,
        userId: number,
        content: Content,
        likes: number[],
        comments: number[],
        uploadTime: String) 
       {}
}