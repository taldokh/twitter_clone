"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Post = void 0;
var Post = /** @class */ (function () {
    function Post(postId, userId, content, likes, comments, uploadTime) {
        this.postId = postId;
        this.userId = userId;
        this.content = content;
        this.likes = likes;
        this.comments = comments;
        this.uploadTime = uploadTime;
    }
    return Post;
}());
exports.Post = Post;
