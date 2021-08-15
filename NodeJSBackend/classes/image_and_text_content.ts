import { TextContent } from './text_content';

export class ImageAndTextContent extends TextContent {

    constructor(public image: String, text: String) {
        super(text);
    }
}