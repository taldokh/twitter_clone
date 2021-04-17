import 'content.dart';

// a content object type that based on a text
class TextContent extends Content {
  final String _text;

  TextContent(this._text);

  String get text => this._text;
}
