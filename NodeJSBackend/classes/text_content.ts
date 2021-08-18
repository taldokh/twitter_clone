import { Content } from './content';

export class TextContent extends Content {

    constructor(public text: String) {
        super();
    }
}