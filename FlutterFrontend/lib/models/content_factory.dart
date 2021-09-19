import 'package:FlutterFrontend/models/content.dart';
import 'package:FlutterFrontend/models/image_and_text_content.dart';
import 'package:FlutterFrontend/models/image_content.dart';
import 'package:FlutterFrontend/models/text_content.dart';

class ContentFactory {
  static Content getContent(Map<String, dynamic> contentParsedJson) {
    Content result;
    if (contentParsedJson['type'] == 1) {
      result = TextContent(contentParsedJson['text']);
    } else if (contentParsedJson['type'] == 2) {
      result = ImageContent(contentParsedJson['imageId']);
    } else if (contentParsedJson['type'] == 3) {
      result = ImageAndTextContent(
          contentParsedJson['imageId'], contentParsedJson['text']);
    }
    return result;
  }
}
