import { Schema } from 'mongoose';

export const userSchema = new Schema({
    _id: Number,
    password: String,
    name: String,
    handle: String,
    email: String,
    bio: String,
    photo: String,
    headerPhoto: String,
    followers: [Number],
    following: [Number],
    posts: [Number],
    joinDate: String,
    followersCount: String,
    followingCount: String
});
