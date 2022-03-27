// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Habits`
  String get habits {
    return Intl.message(
      'Habits',
      name: 'habits',
      desc: '',
      args: [],
    );
  }

  /// `New habit`
  String get new_habits {
    return Intl.message(
      'New habit',
      name: 'new_habits',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Frequency`
  String get frequency {
    return Intl.message(
      'Frequency',
      name: 'frequency',
      desc: '',
      args: [],
    );
  }

  /// `Times a week`
  String get times_a_week {
    return Intl.message(
      'Times a week',
      name: 'times_a_week',
      desc: '',
      args: [],
    );
  }

  /// `Reminder text`
  String get reminder_text {
    return Intl.message(
      'Reminder text',
      name: 'reminder_text',
      desc: '',
      args: [],
    );
  }

  /// `Reminder`
  String get reminder {
    return Intl.message(
      'Reminder',
      name: 'reminder',
      desc: '',
      args: [],
    );
  }

  /// `Just notification`
  String get just_notification {
    return Intl.message(
      'Just notification',
      name: 'just_notification',
      desc: '',
      args: [],
    );
  }

  /// `times a week`
  String get times_a_week_1 {
    return Intl.message(
      'times a week',
      name: 'times_a_week_1',
      desc: '',
      args: [],
    );
  }

  /// `Everyday`
  String get everyday {
    return Intl.message(
      'Everyday',
      name: 'everyday',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `The title should not remain empty`
  String get title_validator_message {
    return Intl.message(
      'The title should not remain empty',
      name: 'title_validator_message',
      desc: '',
      args: [],
    );
  }

  /// `Reminder can't be empty`
  String get reminder_validator_message {
    return Intl.message(
      'Reminder can\'t be empty',
      name: 'reminder_validator_message',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get dark_theme {
    return Intl.message(
      'Dark Theme',
      name: 'dark_theme',
      desc: '',
      args: [],
    );
  }

  /// `By title`
  String get by_title {
    return Intl.message(
      'By title',
      name: 'by_title',
      desc: '',
      args: [],
    );
  }

  /// `By frequency`
  String get by_frequency {
    return Intl.message(
      'By frequency',
      name: 'by_frequency',
      desc: '',
      args: [],
    );
  }

  /// `By completed days`
  String get by_completed_days {
    return Intl.message(
      'By completed days',
      name: 'by_completed_days',
      desc: '',
      args: [],
    );
  }

  /// `Reminder Off`
  String get reminder_off {
    return Intl.message(
      'Reminder Off',
      name: 'reminder_off',
      desc: '',
      args: [],
    );
  }

  /// `Reminder on`
  String get reminder_on {
    return Intl.message(
      'Reminder on',
      name: 'reminder_on',
      desc: '',
      args: [],
    );
  }

  /// `done`
  String get done_1 {
    return Intl.message(
      'done',
      name: 'done_1',
      desc: '',
      args: [],
    );
  }

  /// `times`
  String get times {
    return Intl.message(
      'times',
      name: 'times',
      desc: '',
      args: [],
    );
  }

  /// `total`
  String get total {
    return Intl.message(
      'total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `month`
  String get month {
    return Intl.message(
      'month',
      name: 'month',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
