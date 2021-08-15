"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.postService = void 0;
var postDal = require('./dalPost');
exports.postService = {
    homeWall: function (id) {
        var posts = postDal.homeWall(parseInt(id));
        return posts;
    }
};
