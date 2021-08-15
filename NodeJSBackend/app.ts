const express = require('express');
const app = express();
const port = 3000;

const postRoutes = require('./modules/post/routesPost');
const userRoutes = require('./modules/post/userPost');

app.get('/', (_req: any, res: any) => {
    res.send('hello world');
});

app.use('/post', postRoutes);

app.use('/user', userRoutes);

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});