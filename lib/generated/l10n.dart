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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Enter Your Phone number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter Your Phone number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueButton {
    return Intl.message('Continue', name: 'continueButton', desc: '', args: []);
  }

  /// `Next`
  String get nextButton {
    return Intl.message('Next', name: 'nextButton', desc: '', args: []);
  }

  /// `Enter 6-digit code sent via SMS`
  String get enterOtp {
    return Intl.message(
      'Enter 6-digit code sent via SMS',
      name: 'enterOtp',
      desc: '',
      args: [],
    );
  }

  /// `Total Balance`
  String get totalBalance {
    return Intl.message(
      'Total Balance',
      name: 'totalBalance',
      desc: '',
      args: [],
    );
  }

  /// `Recent Transaction`
  String get transaction {
    return Intl.message(
      'Recent Transaction',
      name: 'transaction',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message('See All', name: 'seeAll', desc: '', args: []);
  }

  /// `CARD HOLDER`
  String get cardHolder {
    return Intl.message('CARD HOLDER', name: 'cardHolder', desc: '', args: []);
  }

  /// `EXPIRES`
  String get expires {
    return Intl.message('EXPIRES', name: 'expires', desc: '', args: []);
  }

  /// `Transfer`
  String get transfer {
    return Intl.message('Transfer', name: 'transfer', desc: '', args: []);
  }

  /// `Deposit`
  String get deposit {
    return Intl.message('Deposit', name: 'deposit', desc: '', args: []);
  }

  /// `Send to`
  String get sendTo {
    return Intl.message('Send to', name: 'sendTo', desc: '', args: []);
  }

  /// `amount`
  String get amount {
    return Intl.message('amount', name: 'amount', desc: '', args: []);
  }

  /// `phone number can not be empty!`
  String get phoneValidation {
    return Intl.message(
      'phone number can not be empty!',
      name: 'phoneValidation',
      desc: '',
      args: [],
    );
  }

  /// `phone number is wrong`
  String get phoneLengthValidation {
    return Intl.message(
      'phone number is wrong',
      name: 'phoneLengthValidation',
      desc: '',
      args: [],
    );
  }

  /// `Invalid amount`
  String get amountValidation {
    return Intl.message(
      'Invalid amount',
      name: 'amountValidation',
      desc: '',
      args: [],
    );
  }

  /// `No transactions yet`
  String get noTransactionsYet {
    return Intl.message(
      'No transactions yet',
      name: 'noTransactionsYet',
      desc: '',
      args: [],
    );
  }

  /// `Transactions`
  String get transactions {
    return Intl.message(
      'Transactions',
      name: 'transactions',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
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
