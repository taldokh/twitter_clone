import { TextContent } from './text_content';

export class ImageAndTextContent extends TextContent {

    constructor(image: String, text: String) {
        super(text);
    }
}