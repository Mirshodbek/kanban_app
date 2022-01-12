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

  /// `Github`
  String get github {
    return Intl.message(
      'Github',
      name: 'github',
      desc: '',
      args: [],
    );
  }

  /// `Нет аккаунта`
  String get noAccount {
    return Intl.message(
      'Нет аккаунта',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Войти`
  String get login {
    return Intl.message(
      'Войти',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Проверьте ввод`
  String get inputError {
    return Intl.message(
      'Проверьте ввод',
      name: 'inputError',
      desc: '',
      args: [],
    );
  }

  /// `Имя пользователя`
  String get userName {
    return Intl.message(
      'Имя пользователя',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Поиск пользователя`
  String get searchUser {
    return Intl.message(
      'Поиск пользователя',
      name: 'searchUser',
      desc: '',
      args: [],
    );
  }

  /// `Что-то пошло не так :-(`
  String get errorGeneral {
    return Intl.message(
      'Что-то пошло не так :-(',
      name: 'errorGeneral',
      desc: '',
      args: [],
    );
  }

  /// `Нет подходящий пользователя`
  String get noUser {
    return Intl.message(
      'Нет подходящий пользователя',
      name: 'noUser',
      desc: '',
      args: [],
    );
  }

  /// `Репозитори`
  String get repositories {
    return Intl.message(
      'Репозитори',
      name: 'repositories',
      desc: '',
      args: [],
    );
  }

  /// `Назад`
  String get back {
    return Intl.message(
      'Назад',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Описания`
  String get description {
    return Intl.message(
      'Описания',
      name: 'description',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru', countryCode: 'RU'),
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
