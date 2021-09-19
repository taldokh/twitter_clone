import { Content } from './content';

export class TextContent extends Content {

    constructor(public text: String, type = 1) {
        super(type);
    }
}