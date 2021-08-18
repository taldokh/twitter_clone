"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.User = void 0;
var User = /** @class */ (function () {
    function User(id, password, name, handle, email, bio, photo, headerPhoto, followers, following, posts, joinDate, followersCount, followingCount) {
        this.id = id;
        this.password = password;
        this.name = name;
        this.handle = handle;
        this.email = email;
        this.bio = bio;
        this.photo = photo;
        this.headerPhoto = headerPhoto;
        this.followers = followers;
        this.following = following;
        this.posts = posts;
        this.joinDate = joinDate;
        this.followersCount = followersCount;
        this.followingCount = followingCount;
    }
    return User;
}());
exports.User = User;
