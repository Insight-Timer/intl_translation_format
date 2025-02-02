import 'package:intl_translation_format/intl_translation_format.dart';
import 'package:intl_translation_format/test_utils.dart';

import 'package:intl_translation_xliff/intl_translation_xliff.dart';
import 'package:test/test.dart';

void main() {
  group('Xliff v2.0 -', () {
    group('with Target Language -', () {
      testFormat(_ParseTesterWithTargetLanguage());
    });

    testFormat(_ParseTester());

    testFormat(_TemplateGenerationTester());
  });
}

// Tests for xliff v2.0 with a target language
class _ParseTesterWithTargetLanguage extends MultilingualParsingTester {
  @override
  MultiLingualFormat get format => XliffFormat(XliffVersion.v2);

  @override
  String get simpleMessage => '''
<?xml version="1.0 encoding="UTF-8""?>
<xliff xmlns="urn:oasis:names:tc:xliff:document:2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:oasis:names:tc:xliff:document:2.0 http://docs.oasis-open.org/xliff/xliff-core/v2.0/os/schemas/xliff_core_2.0.xsd" version="2.0" srcLang="en" trgLang="es">
  <file>
    <unit id="simpleMessage" name="simpleMessage">
      <segment>
        <notes>
          <note category="format">icu</note>
        </notes>
        <source>Simple Message</source>
        <target>Mensaje simple</target>
      </segment>
    </unit>
  </file>
</xliff>''';

  @override
  String get messageWithMetadata => '''
<?xml version="1.0 encoding="UTF-8""?>
<xliff xmlns="urn:oasis:names:tc:xliff:document:2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:oasis:names:tc:xliff:document:2.0 http://docs.oasis-open.org/xliff/xliff-core/v2.0/os/schemas/xliff_core_2.0.xsd" version="2.0" srcLang="en" trgLang="es">
  <file>
    <unit id="messageWithMetadata" name="messageWithMetadata">
      <segment>
        <notes>
          <note category="format">icu</note>
          <note category="description">This is a description</note>
        </notes>
        <source>Message With Metadata</source>
        <target>Mensaje con Metadatos</target>
      </segment>
    </unit>
  </file>
</xliff>''';

  @override
  String get pluralMessage => '''
<?xml version="1.0 encoding="UTF-8""?>
<xliff xmlns="urn:oasis:names:tc:xliff:document:2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:oasis:names:tc:xliff:document:2.0 http://docs.oasis-open.org/xliff/xliff-core/v2.0/os/schemas/xliff_core_2.0.xsd" version="2.0" srcLang="en" trgLang="es">
  <file>
    <unit id="pluralExample" name="pluralExample">
      <segment>
        <notes>
          <note category="format">icu</note>
        </notes>
        <source>{howMany,plural, =0{No items}=1{One item}many{A lot of items}other{{howMany} items}}</source>
        <target>{howMany,plural, =0{Ningún elemento}=1{Un elemento}many{Muchos elementos}other{{howMany} elementos}}</target>
      </segment>
    </unit>
  </file>
</xliff>''';

  @override
  String get variableMessage => '''
<?xml version="1.0 encoding="UTF-8""?>
<xliff xmlns="urn:oasis:names:tc:xliff:document:2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:oasis:names:tc:xliff:document:2.0 http://docs.oasis-open.org/xliff/xliff-core/v2.0/os/schemas/xliff_core_2.0.xsd" version="2.0" srcLang="en" trgLang="es">
  <file>
    <unit id="messageWithVariable" name="messageWithVariable">
      <segment>
        <notes>
          <note category="format">icu</note>
        </notes>
        <source>Share {variable}</source>
        <target>Compartir {variable}</target>
      </segment>
    </unit>
  </file>
</xliff>''';

  @override
  String get allMessages => '''
<?xml version="1.0 encoding="UTF-8""?>
<xliff xmlns="urn:oasis:names:tc:xliff:document:2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:oasis:names:tc:xliff:document:2.0 http://docs.oasis-open.org/xliff/xliff-core/v2.0/os/schemas/xliff_core_2.0.xsd" version="2.0" srcLang="en" trgLang="es">
  <file>
    <unit id="simpleMessage" name="simpleMessage">
      <segment>
        <notes>
          <note category="format">icu</note>
        </notes>
        <source>Simple Message</source>
        <target>Mensaje simple</target>
      </segment>
    </unit>
    <unit id="messageWithMetadata" name="messageWithMetadata">
      <segment>
        <notes>
          <note category="format">icu</note>
          <note category="description">This is a description</note>
        </notes>
        <source>Message With Metadata</source>
        <target>Mensaje con Metadatos</target>
      </segment>
    </unit>
    <unit id="pluralExample" name="pluralExample">
      <segment>
        <notes>
          <note category="format">icu</note>
        </notes>
        <source>{howMany,plural, =0{No items}=1{One item}many{A lot of items}other{{howMany} items}}</source>
        <target>{howMany,plural, =0{Ningún elemento}=1{Un elemento}many{Muchos elementos}other{{howMany} elementos}}</target>
      </segment>
    </unit>
    <unit id="messageWithVariable" name="messageWithVariable">
      <segment>
        <notes>
          <note category="format">icu</note>
        </notes>
        <source>Share {variable}</source>
        <target>Compartir {variable}</target>
      </segment>
    </unit>
  </file>
</xliff>''';
}

// Tests for xliff v2.0 without a target language
class _ParseTester extends MultilingualParsingTester {
  @override
  MultiLingualFormat get format => XliffFormat(XliffVersion.v2);

  @override
  String get simpleMessage => '''
<?xml version="1.0 encoding="UTF-8""?>
<xliff xmlns="urn:oasis:names:tc:xliff:document:2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:oasis:names:tc:xliff:document:2.0 http://docs.oasis-open.org/xliff/xliff-core/v2.0/os/schemas/xliff_core_2.0.xsd" version="2.0" srcLang="en">
  <file>
    <unit id="simpleMessage" name="simpleMessage">
      <segment>
        <notes>
          <note category="format">icu</note>
        </notes>
        <source>Simple Message</source>
      </segment>
    </unit>
  </file>
</xliff>''';

  @override
  String get messageWithMetadata => '''
<?xml version="1.0 encoding="UTF-8""?>
<xliff xmlns="urn:oasis:names:tc:xliff:document:2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:oasis:names:tc:xliff:document:2.0 http://docs.oasis-open.org/xliff/xliff-core/v2.0/os/schemas/xliff_core_2.0.xsd" version="2.0" srcLang="en">
  <file>
    <unit id="messageWithMetadata" name="messageWithMetadata">
      <segment>
        <notes>
          <note category="format">icu</note>
          <note category="description">This is a description</note>
        </notes>
        <source>Message With Metadata</source>
      </segment>
    </unit>
  </file>
</xliff>''';

  @override
  String get pluralMessage => '''
<?xml version="1.0 encoding="UTF-8""?>
<xliff xmlns="urn:oasis:names:tc:xliff:document:2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:oasis:names:tc:xliff:document:2.0 http://docs.oasis-open.org/xliff/xliff-core/v2.0/os/schemas/xliff_core_2.0.xsd" version="2.0" srcLang="en">
  <file>
    <unit id="pluralExample" name="pluralExample">
      <segment>
        <notes>
          <note category="format">icu</note>
        </notes>
        <source>{howMany,plural, =0{No items}=1{One item}many{A lot of items}other{{howMany} items}}</source>
      </segment>
    </unit>
  </file>
</xliff>''';

  @override
  String get variableMessage => '''
<?xml version="1.0 encoding="UTF-8""?>
<xliff xmlns="urn:oasis:names:tc:xliff:document:2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:oasis:names:tc:xliff:document:2.0 http://docs.oasis-open.org/xliff/xliff-core/v2.0/os/schemas/xliff_core_2.0.xsd" version="2.0" srcLang="en">
  <file>
    <unit id="messageWithVariable" name="messageWithVariable">
      <segment>
        <notes>
          <note category="format">icu</note>
        </notes>
        <source>Share {variable}</source>
      </segment>
    </unit>
  </file>
</xliff>''';

  @override
  String get allMessages => '''
<?xml version="1.0 encoding="UTF-8""?>
<xliff xmlns="urn:oasis:names:tc:xliff:document:2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:oasis:names:tc:xliff:document:2.0 http://docs.oasis-open.org/xliff/xliff-core/v2.0/os/schemas/xliff_core_2.0.xsd" version="2.0" srcLang="en" trgLang="es">
  <file>
    <unit id="simpleMessage" name="simpleMessage">
      <segment>
        <notes>
          <note category="format">icu</note>
        </notes>
        <source>Simple Message</source>
        <target>Mensaje simple</target>
      </segment>
    </unit>
    <unit id="messageWithMetadata" name="messageWithMetadata">
      <segment>
        <notes>
          <note category="format">icu</note>
          <note category="description">This is a description</note>
        </notes>
        <source>Message With Metadata</source>
        <target>Mensaje con Metadatos</target>
      </segment>
    </unit>
    <unit id="pluralExample" name="pluralExample">
      <segment>
        <notes>
          <note category="format">icu</note>
        </notes>
        <source>{howMany,plural, =0{No items}=1{One item}many{A lot of items}other{{howMany} items}}</source>
        <target>{howMany,plural, =0{Ningún elemento}=1{Un elemento}many{Muchos elementos}other{{howMany} elementos}}</target>
      </segment>
    </unit>
    <unit id="messageWithVariable" name="messageWithVariable">
      <segment>
        <notes>
          <note category="format">icu</note>
        </notes>
        <source>Share {variable}</source>
        <target>Compartir {variable}</target>
      </segment>
    </unit>
  </file>
</xliff>''';
}

class _TemplateGenerationTester extends MultilingualGenerateTemplateTester {
  @override
  TranslationFormat<StringFileData> get format => XliffFormat(XliffVersion.v2);
  @override
  String get templateSimpleMessage => ''
      '<?xml version="1.0" encoding="UTF-8"?>\n'
      '<xliff xmlns="urn:oasis:names:tc:xliff:document:2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:oasis:names:tc:xliff:document:2.0 http://docs.oasis-open.org/xliff/xliff-core/v2.0/os/schemas/xliff_core_2.0.xsd" version="2.0" srcLang="en">\n'
      '  <file original="self">\n'
      '    <body>\n'
      '      <unit id="simpleMessage" name="simpleMessage">\n'
      '        <segment>\n'
      '          <notes>\n'
      '            <note category="format">icu</note>\n'
      '          </notes>\n'
      '          <source>Simple Message</source>\n'
      '          <target></target>\n'
      '        </segment>\n'
      '      </unit>\n'
      '    </body>\n'
      '  </file>\n'
      '</xliff>';

  @override
  String get templateMessageWithMetadata => '<?xml version="1.0" encoding="UTF-8"?>\n'
      '<xliff xmlns="urn:oasis:names:tc:xliff:document:2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:oasis:names:tc:xliff:document:2.0 http://docs.oasis-open.org/xliff/xliff-core/v2.0/os/schemas/xliff_core_2.0.xsd" version="2.0" srcLang="en">\n'
      '  <file original="self">\n'
      '    <body>\n'
      '      <unit id="messageWithMetadata" name="messageWithMetadata">\n'
      '        <segment>\n'
      '          <notes>\n'
      '            <note category="format">icu</note>\n'
      '            <note category="description">This is a description</note>\n'
      '          </notes>\n'
      '          <source>Message With Metadata</source>\n'
      '          <target></target>\n'
      '        </segment>\n'
      '      </unit>\n'
      '    </body>\n'
      '  </file>\n'
      '</xliff>';

  @override
  String get templatePluralMessage => '<?xml version="1.0" encoding="UTF-8"?>\n'
      '<xliff xmlns="urn:oasis:names:tc:xliff:document:2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:oasis:names:tc:xliff:document:2.0 http://docs.oasis-open.org/xliff/xliff-core/v2.0/os/schemas/xliff_core_2.0.xsd" version="2.0" srcLang="en">\n'
      '  <file original="self">\n'
      '    <body>\n'
      '      <unit id="pluralExample" name="pluralExample">\n'
      '        <segment>\n'
      '          <notes>\n'
      '            <note category="format">icu</note>\n'
      '          </notes>\n'
      '          <source>{howMany,plural, =0{No items}=1{One item}many{A lot of items}other{&lt;ph id="0">{howMany}&lt;/ph> items}}</source>\n'
      '          <target></target>\n'
      '        </segment>\n'
      '      </unit>\n'
      '    </body>\n'
      '  </file>\n'
      '</xliff>';

  @override
  String get templateVariableMessage => '<?xml version="1.0" encoding="UTF-8"?>\n'
      '<xliff xmlns="urn:oasis:names:tc:xliff:document:2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:oasis:names:tc:xliff:document:2.0 http://docs.oasis-open.org/xliff/xliff-core/v2.0/os/schemas/xliff_core_2.0.xsd" version="2.0" srcLang="en">\n'
      '  <file original="self">\n'
      '    <body>\n'
      '      <unit id="messageWithVariable" name="messageWithVariable">\n'
      '        <segment>\n'
      '          <notes>\n'
      '            <note category="format">icu</note>\n'
      '          </notes>\n'
      '          <source>Share &lt;ph id="0">{variable}&lt;/ph></source>\n'
      '          <target></target>\n'
      '        </segment>\n'
      '      </unit>\n'
      '    </body>\n'
      '  </file>\n'
      '</xliff>';

  @override
  String get templateAllMessages => '<?xml version="1.0" encoding="UTF-8"?>\n'
      '<xliff xmlns="urn:oasis:names:tc:xliff:document:2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:oasis:names:tc:xliff:document:2.0 http://docs.oasis-open.org/xliff/xliff-core/v2.0/os/schemas/xliff_core_2.0.xsd" version="2.0" srcLang="en">\n'
      '  <file original="self">\n'
      '    <body>\n'
      '      <unit id="simpleMessage" name="simpleMessage">\n'
      '        <segment>\n'
      '          <notes>\n'
      '            <note category="format">icu</note>\n'
      '          </notes>\n'
      '          <source>Simple Message</source>\n'
      '          <target></target>\n'
      '        </segment>\n'
      '      </unit>\n'
      '      <unit id="messageWithMetadata" name="messageWithMetadata">\n'
      '        <segment>\n'
      '          <notes>\n'
      '            <note category="format">icu</note>\n'
      '            <note category="description">This is a description</note>\n'
      '          </notes>\n'
      '          <source>Message With Metadata</source>\n'
      '          <target></target>\n'
      '        </segment>\n'
      '      </unit>\n'
      '      <unit id="pluralExample" name="pluralExample">\n'
      '        <segment>\n'
      '          <notes>\n'
      '            <note category="format">icu</note>\n'
      '          </notes>\n'
      '          <source>{howMany,plural, =0{No items}=1{One item}many{A lot of items}other{&lt;ph id="0">{howMany}&lt;/ph> items}}</source>\n'
      '          <target></target>\n'
      '        </segment>\n'
      '      </unit>\n'
      '      <unit id="messageWithVariable" name="messageWithVariable">\n'
      '        <segment>\n'
      '          <notes>\n'
      '            <note category="format">icu</note>\n'
      '          </notes>\n'
      '          <source>Share &lt;ph id="0">{variable}&lt;/ph></source>\n'
      '          <target></target>\n'
      '        </segment>\n'
      '      </unit>\n'
      '    </body>\n'
      '  </file>\n'
      '</xliff>';
}
