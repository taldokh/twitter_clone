import { Content } from './content';

export class Post {

    constructor(
        public postId: number,
        public userId: number,
        public content: Content,
        public likes: number[],
        public comments: number[],
        public uploadTime: string) { }


}