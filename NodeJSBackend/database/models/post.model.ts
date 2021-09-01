const mongoose = require('mongoose');
import { postSchema } from './../schema/post.schema';

const Post = mongoose.model('Post', postSchema);

export { Post };