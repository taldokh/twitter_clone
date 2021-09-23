import { Content } from './content';

export class ImageContent extends Content {

    constructor(public imageId: number) {
        super(2);
    }
}