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

  /// `Tode`
  String get app_title {
    return Intl.message(
      'Tode',
      name: 'app_title',
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

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Title Task`
  String get title_Task {
    return Intl.message(
      'Title Task',
      name: 'title_Task',
      desc: '',
      args: [],
    );
  }

  /// `Pless Writing Title`
  String get pless_writing_Title {
    return Intl.message(
      'Pless Writing Title',
      name: 'pless_writing_Title',
      desc: '',
      args: [],
    );
  }

  /// `Description Task`
  String get task_description {
    return Intl.message(
      'Description Task',
      name: 'task_description',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get select_date {
    return Intl.message(
      'Select Date',
      name: 'select_date',
      desc: '',
      args: [],
    );
  }

  /// `Edit Task`
  String get edit_Task {
    return Intl.message(
      'Edit Task',
      name: 'edit_Task',
      desc: '',
      args: [],
    );
  }

  /// `Loading ...`
  String get loading {
    return Intl.message(
      'Loading ...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Done Added The Task`
  String get done_added_the_task {
    return Intl.message(
      'Done Added The Task',
      name: 'done_added_the_task',
      desc: '',
      args: [],
    );
  }

  /// `Done Saved The Task locally`
  String get done_saved_The_Task_locally {
    return Intl.message(
      'Done Saved The Task locally',
      name: 'done_saved_The_Task_locally',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Title`
  String get please_enter_title {
    return Intl.message(
      'Please Enter Title',
      name: 'please_enter_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Task`
  String get enter_your_task {
    return Intl.message(
      'Enter Your Task',
      name: 'enter_your_task',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Description`
  String get please_enter_description {
    return Intl.message(
      'Please Enter Description',
      name: 'please_enter_description',
      desc: '',
      args: [],
    );
  }

  /// `Done Delete The Task Locally`
  String get done_delete_the_task_locally {
    return Intl.message(
      'Done Delete The Task Locally',
      name: 'done_delete_the_task_locally',
      desc: '',
      args: [],
    );
  }

  /// `Done Delete The Task`
  String get done_delete_the_task {
    return Intl.message(
      'Done Delete The Task',
      name: 'done_delete_the_task',
      desc: '',
      args: [],
    );
  }

  /// `Done!`
  String get done {
    return Intl.message(
      'Done!',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Error Not deleted The Task`
  String get error_not_deleted_the_task {
    return Intl.message(
      'Error Not deleted The Task',
      name: 'error_not_deleted_the_task',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `dark`
  String get dark {
    return Intl.message(
      'dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Add Task`
  String get add_task {
    return Intl.message(
      'Add Task',
      name: 'add_task',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
