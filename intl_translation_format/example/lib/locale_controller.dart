import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

//import 'l10n/intl_messages_all.dart';

// A [ValueNotifier] that stores the current locale,
// and notifies to their listeners when this changes.
class LocaleController extends ValueNotifier<String> {
  final List<String> _availableLocales;

  LocaleController(String initialLocale, {List<String>? availableLocales})
      : _availableLocales = availableLocales ?? [initialLocale],
        super(initialLocale);
}

/// A widget that propagates the LocaleController down the Widget tree and
/// updates when the current locale changes.
///
/// DefaultLocale.of(context) returns the locale controller
class DefaultLocale extends InheritedNotifier<LocaleController> {
  const DefaultLocale({
    Key? key,
    LocaleController? localeController,
    required Widget child,
  }) : super(key: key, child: child, notifier: localeController);

  static LocaleController? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DefaultLocale>()?.notifier;
}

// A widget that stores the current locale and handles the initialization
// of the messages of a new locale when the current locale changes
class DefaultLocaleController extends StatefulWidget {
  final String initialLocale;
  final List<String>? availableLocales;
  final Widget child;

  const DefaultLocaleController({Key? key, required this.initialLocale, required this.child, this.availableLocales})
      : super(key: key);
  @override
  _DefaultLocaleState createState() => _DefaultLocaleState();
}

// A widget that stores the current locale and handles the initialization
// of the messages of a new locale when the current locale changes
class _DefaultLocaleState extends State<DefaultLocaleController> {
  late LocaleController controller;

  @override
  void initState() {
    controller = LocaleController(widget.initialLocale, availableLocales: widget.availableLocales);

    controller.addListener(updateIntlLocale);
    updateIntlLocale();
    super.initState();
  }

  void updateIntlLocale() {
    //initializeMessages(controller.value);
    Intl.defaultLocale = controller.value;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLocale(
      localeController: controller,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    controller.removeListener(updateIntlLocale);
    controller.dispose();
    super.dispose();
  }
}

// A segment control that allows the user to change the current
// locale and choose between the available ones.
//
// This widget needs to be inside a DefaultLocaleController that will
// be the one that handle changes needed to display the new locale.
class LocaleSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = DefaultLocale.of(context);
    final locales = controller?._availableLocales ?? [];
    return CupertinoSlidingSegmentedControl<String>(
      groupValue: controller?.value,
      children: Map.fromEntries(
        locales.map(
          (locale) => MapEntry(
            locale,
            Text(locale),
          ),
        ),
      ),
      onValueChanged: (newLocale) {
        if (newLocale != null) {
          controller?.value = newLocale;
        }
      },
    );
  }
}
