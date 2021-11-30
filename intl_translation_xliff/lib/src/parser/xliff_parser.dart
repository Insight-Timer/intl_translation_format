import 'package:intl_translation_format/intl_translation_format.dart';
import 'package:intl_translation_xliff/src/parser/xliff_elements.dart';
import 'package:intl_translation_xliff/src/parser/xml_parser.dart';

import 'package:xml/xml_events.dart';

class XliffParser {
  final bool displayWarnings;
  final XliffVersion version;
  final bool multilingual;

  XliffParser({
    this.displayWarnings = false,
    this.version = XliffVersion.v2,
    this.multilingual = false,
  });

  List<MessagesForLocale?> parse(
    String xliff, {
    String? sourceLocale,
    String? key,
  }) {
    final xliffParsed = xliff
        .replaceAll(RegExp("<\/b>"), 'BOLD_ELEM_END')
        .replaceAll(RegExp("<b>"), 'BOLD_ELEM_START')
        .replaceAll(RegExp("<\/ph>"), '')
        .replaceAll(RegExp("<ph id=\".\">"), '');
    return XliffParserState(
      parseEvents(xliffParsed),
      key,
      version,
      displayWarnings: displayWarnings,
      sourceLocale: sourceLocale,
    ).parse();
  }
}

class XliffParserException extends XmlParserException {
  XliffParserException({
    String? title,
    String? description,
    String? context,
  }) : super(
          title: title,
          description: description,
          context: context,
        );

  @override
  String toString() {
    return '''
    Error while parsing xliff
    $title:
    $description,
    Context: $context
    ''';
  }
}

/// The implementation of [XliffParser].
///
/// Maintains state while pushing an [XmlPushReader] through the XML tree.
class XliffParserState extends XmlParserState<List<MessagesForLocale?>> {
  /// Creates a new [XliffParserState].
  XliffParserState(
    Iterable<XmlEvent> events,
    String? _key,
    this.version, {
    this.sourceLocale,
    bool displayWarnings = true,
  })  : assert(events != null),
        super(
          events,
          _key,
          displayWarnings: displayWarnings,
        );

  final XliffVersion version;
  final String? sourceLocale;

  bool multilingual = false;

  MessagesForLocale? sourceMessages;
  MessagesForLocale? targetMessages;

  String? currentTranslationId;
  String? currentTranslationMessage;
  String? currentTargetTranslationMessage;

  @override
  Map<String, ElementBuilder> get elementHandlers => <String, ElementBuilder>{
        'xliff': () => XliffRootElement(),
        'file': () => FileElement(),
        'source': () => SourceElement(),
        'target': () => TargetElement(),

        //v2.0
        'group': () => GroupElement(),
        'unit': () => UnitElement(),
        'segment': () => SegmentElement(),
        'ignorable': () => IgnorableElement(),

        //v1.2
        'body': () => BodyElement(),
        'trans-unit': () => UnitElement(),
      };

  @override
  List<MessagesForLocale?> get value =>
      [sourceMessages, if (multilingual) targetMessages];
}
