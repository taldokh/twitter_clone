import { TextContent } from './text_content';

export class ImageAndTextContent extends TextContent {

    constructor(public imageId: number, text: string) {
        super(text, 3);
    }
}