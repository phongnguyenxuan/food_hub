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

  /// `Welcome to`
  String get welcome {
    return Intl.message(
      'Welcome to',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Your favourite foods delivered\nfast at your door.`
  String get yourFavourite {
    return Intl.message(
      'Your favourite foods delivered\nfast at your door.',
      name: 'yourFavourite',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with`
  String get signinWith {
    return Intl.message(
      'Sign in with',
      name: 'signinWith',
      desc: '',
      args: [],
    );
  }

  /// `Start with email or phone`
  String get startWith {
    return Intl.message(
      'Start with email or phone',
      name: 'startWith',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get alreadyHave {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHave',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullName {
    return Intl.message(
      'Full name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email {
    return Intl.message(
      'E-mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get pass {
    return Intl.message(
      'Password',
      name: 'pass',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgot {
    return Intl.message(
      'Forgot password?',
      name: 'forgot',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account?`
  String get dontHave {
    return Intl.message(
      'Don’t have an account?',
      name: 'dontHave',
      desc: '',
      args: [],
    );
  }

  /// `Your email or phone`
  String get mailMessage {
    return Intl.message(
      'Your email or phone',
      name: 'mailMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your name`
  String get nameMessage {
    return Intl.message(
      'Your name',
      name: 'nameMessage',
      desc: '',
      args: [],
    );
  }

  /// `Approve`
  String get approve {
    return Intl.message(
      'Approve',
      name: 'approve',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get invalid {
    return Intl.message(
      'Invalid email',
      name: 'invalid',
      desc: '',
      args: [],
    );
  }

  /// `Email has been disabled`
  String get userDisabled {
    return Intl.message(
      'Email has been disabled',
      name: 'userDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Your email or password not correct`
  String get userNotFound {
    return Intl.message(
      'Your email or password not correct',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Your email or password not correct`
  String get wrongPassword {
    return Intl.message(
      'Your email or password not correct',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email already use on another account`
  String get emailAlreadyUse {
    return Intl.message(
      'Email already use on another account',
      name: 'emailAlreadyUse',
      desc: '',
      args: [],
    );
  }

  /// `Account already exists with the same email address`
  String get accountExists {
    return Intl.message(
      'Account already exists with the same email address',
      name: 'accountExists',
      desc: '',
      args: [],
    );
  }

  /// `Field can't be blank`
  String get blank {
    return Intl.message(
      'Field can\'t be blank',
      name: 'blank',
      desc: '',
      args: [],
    );
  }

  /// `Password must has at least 8 characers, at least 1 capital letter, 1 number and 1 special character`
  String get passValidator {
    return Intl.message(
      'Password must has at least 8 characers, at least 1 capital letter, 1 number and 1 special character',
      name: 'passValidator',
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
      Locale.fromSubtags(languageCode: 'vi'),
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
