"use strict";
var express = require('express');
var app = express();
var port = 3000;
var postRoutes = require('./modules/post/routesPost');
var userRoutes = require('./modules/post/userPost');
app.get('/', function (_req, res) {
    res.send('hello world');
});
app.use('/post', postRoutes);
app.use('/user', userRoutes);
app.listen(port, function () {
    console.log("Example app listening at http://localhost:" + port);
});
