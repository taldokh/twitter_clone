import { GridFSBucket } from "mongodb";
const mongodb = require('mongodb');

export let fsBucket: GridFSBucket;
export function initFSBucket(db: Object){
    fsBucket = new mongodb.GridFSBucket(db);
};