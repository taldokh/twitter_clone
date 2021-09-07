import { Schema } from 'mongoose';

export const userSchema = new Schema({
    _id: Number,
    password: String,
    name: String,
    handle: String,
    email: String,
    bio: String,
    profileImageId: Number,
    headerImageId: Number,
    followers: [Number],
    following: [Number],
    posts: [Number],
    joinDate: String,
    followersCount: String,
    followingCount: String
});
