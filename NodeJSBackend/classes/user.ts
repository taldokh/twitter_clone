export class User {

    constructor(
        public id: number,
        public password: string,
        public name: string,
        public handle: string,
        public email: string,
        public bio: string,
        public photo: string,
        public headerPhoto: string,
        public followers: number[],
        public following: number[],
        public posts: number[],
        public joinDate: string,
        public followersCount: string,
        public followingCount: string
    ) { }
}