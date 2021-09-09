import { Schema } from 'mongoose';

export const postSchema = new Schema({
    _id: Number,
    userId: Number,
    content: Object,
    likes: [Number],
    comments: [Number],
    uploadTime: String
});
