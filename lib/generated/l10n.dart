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

  /// `LastTime`
  String get app_name {
    return Intl.message('LastTime', name: 'app_name', desc: '', args: []);
  }

  /// `Track when you last did anything`
  String get slogan {
    return Intl.message(
      'Track when you last did anything',
      name: 'slogan',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Never logged`
  String get never_logged {
    return Intl.message(
      'Never logged',
      name: 'never_logged',
      desc: '',
      args: [],
    );
  }

  /// `Replace`
  String get replace {
    return Intl.message('Replace', name: 'replace', desc: '', args: []);
  }

  /// `New event`
  String get new_event {
    return Intl.message('New event', name: 'new_event', desc: '', args: []);
  }

  /// `Edit event`
  String get edit_event {
    return Intl.message('Edit event', name: 'edit_event', desc: '', args: []);
  }

  /// `New Icon`
  String get new_icon {
    return Intl.message('New Icon', name: 'new_icon', desc: '', args: []);
  }

  /// `Custom event`
  String get custom_event {
    return Intl.message(
      'Custom event',
      name: 'custom_event',
      desc: '',
      args: [],
    );
  }

  /// `Haircut`
  String get haircut {
    return Intl.message('Haircut', name: 'haircut', desc: '', args: []);
  }

  /// `Replace Razor`
  String get replace_razor {
    return Intl.message(
      'Replace Razor',
      name: 'replace_razor',
      desc: '',
      args: [],
    );
  }

  /// `Replace Toothbrush`
  String get replace_toothbrush {
    return Intl.message(
      'Replace Toothbrush',
      name: 'replace_toothbrush',
      desc: '',
      args: [],
    );
  }

  /// `Wash Makeup Brushes`
  String get wash_makeup_brushes {
    return Intl.message(
      'Wash Makeup Brushes',
      name: 'wash_makeup_brushes',
      desc: '',
      args: [],
    );
  }

  /// `Clean Retainer`
  String get clean_retainer {
    return Intl.message(
      'Clean Retainer',
      name: 'clean_retainer',
      desc: '',
      args: [],
    );
  }

  /// `Change Contacts`
  String get change_contacts {
    return Intl.message(
      'Change Contacts',
      name: 'change_contacts',
      desc: '',
      args: [],
    );
  }

  /// `Refill Vitamins`
  String get refill_vitamins {
    return Intl.message(
      'Refill Vitamins',
      name: 'refill_vitamins',
      desc: '',
      args: [],
    );
  }

  /// `Face Mask Night`
  String get face_mask_night {
    return Intl.message(
      'Face Mask Night',
      name: 'face_mask_night',
      desc: '',
      args: [],
    );
  }

  /// `Fresh Sheets`
  String get fresh_sheets {
    return Intl.message(
      'Fresh Sheets',
      name: 'fresh_sheets',
      desc: '',
      args: [],
    );
  }

  /// `Change AC Filter`
  String get change_ac_filter {
    return Intl.message(
      'Change AC Filter',
      name: 'change_ac_filter',
      desc: '',
      args: [],
    );
  }

  /// `Replace Water Filter`
  String get replace_water_filter {
    return Intl.message(
      'Replace Water Filter',
      name: 'replace_water_filter',
      desc: '',
      args: [],
    );
  }

  /// `Clean Oven`
  String get clean_oven {
    return Intl.message('Clean Oven', name: 'clean_oven', desc: '', args: []);
  }

  /// `Flip Mattress`
  String get flip_mattress {
    return Intl.message(
      'Flip Mattress',
      name: 'flip_mattress',
      desc: '',
      args: [],
    );
  }

  /// `Descale Coffeemaker`
  String get descale_coffeemaker {
    return Intl.message(
      'Descale Coffeemaker',
      name: 'descale_coffeemaker',
      desc: '',
      args: [],
    );
  }

  /// `Wash Bath Mat`
  String get wash_bath_mat {
    return Intl.message(
      'Wash Bath Mat',
      name: 'wash_bath_mat',
      desc: '',
      args: [],
    );
  }

  /// `Wipe Fridge Shelves`
  String get wipe_fridge_shelves {
    return Intl.message(
      'Wipe Fridge Shelves',
      name: 'wipe_fridge_shelves',
      desc: '',
      args: [],
    );
  }

  /// `Clean Blinds`
  String get clean_blinds {
    return Intl.message(
      'Clean Blinds',
      name: 'clean_blinds',
      desc: '',
      args: [],
    );
  }

  /// `Clean Microwave`
  String get clean_microwave {
    return Intl.message(
      'Clean Microwave',
      name: 'clean_microwave',
      desc: '',
      args: [],
    );
  }

  /// `Review Subscriptins`
  String get review_subscriptins {
    return Intl.message(
      'Review Subscriptins',
      name: 'review_subscriptins',
      desc: '',
      args: [],
    );
  }

  /// `Clean Keyboard`
  String get clean_keyboard {
    return Intl.message(
      'Clean Keyboard',
      name: 'clean_keyboard',
      desc: '',
      args: [],
    );
  }

  /// `Backup Laptop`
  String get backup_laptop {
    return Intl.message(
      'Backup Laptop',
      name: 'backup_laptop',
      desc: '',
      args: [],
    );
  }

  /// `Update Passwords`
  String get update_passwords {
    return Intl.message(
      'Update Passwords',
      name: 'update_passwords',
      desc: '',
      args: [],
    );
  }

  /// `Wipe Phone Screen`
  String get wipe_phone_screen {
    return Intl.message(
      'Wipe Phone Screen',
      name: 'wipe_phone_screen',
      desc: '',
      args: [],
    );
  }

  /// `Purge Big Photos`
  String get purge_big_photos {
    return Intl.message(
      'Purge Big Photos',
      name: 'purge_big_photos',
      desc: '',
      args: [],
    );
  }

  /// `Update My Apps`
  String get update_my_apps {
    return Intl.message(
      'Update My Apps',
      name: 'update_my_apps',
      desc: '',
      args: [],
    );
  }

  /// `Clear Downloads`
  String get clear_downloads {
    return Intl.message(
      'Clear Downloads',
      name: 'clear_downloads',
      desc: '',
      args: [],
    );
  }

  /// `Oil Change`
  String get oil_change {
    return Intl.message('Oil Change', name: 'oil_change', desc: '', args: []);
  }

  /// `Check Tire Pressure`
  String get check_tire_pressure {
    return Intl.message(
      'Check Tire Pressure',
      name: 'check_tire_pressure',
      desc: '',
      args: [],
    );
  }

  /// `Replace Wiper Blades`
  String get replace_wiper_blades {
    return Intl.message(
      'Replace Wiper Blades',
      name: 'replace_wiper_blades',
      desc: '',
      args: [],
    );
  }

  /// `Car Wash`
  String get car_wash {
    return Intl.message('Car Wash', name: 'car_wash', desc: '', args: []);
  }

  /// `Vacuum Interior`
  String get vacuum_interior {
    return Intl.message(
      'Vacuum Interior',
      name: 'vacuum_interior',
      desc: '',
      args: [],
    );
  }

  /// `Inspect Brake Pads`
  String get inspect_brake_pads {
    return Intl.message(
      'Inspect Brake Pads',
      name: 'inspect_brake_pads',
      desc: '',
      args: [],
    );
  }

  /// `Test Car Battery`
  String get test_car_battery {
    return Intl.message(
      'Test Car Battery',
      name: 'test_car_battery',
      desc: '',
      args: [],
    );
  }

  /// `Flea Treatmeat`
  String get flea_treatmeat {
    return Intl.message(
      'Flea Treatmeat',
      name: 'flea_treatmeat',
      desc: '',
      args: [],
    );
  }

  /// `Heartworm Pill`
  String get heartworm_pill {
    return Intl.message(
      'Heartworm Pill',
      name: 'heartworm_pill',
      desc: '',
      args: [],
    );
  }

  /// `Wash Pet Bed`
  String get wash_pet_bed {
    return Intl.message(
      'Wash Pet Bed',
      name: 'wash_pet_bed',
      desc: '',
      args: [],
    );
  }

  /// `Water Plants`
  String get water_plants {
    return Intl.message(
      'Water Plants',
      name: 'water_plants',
      desc: '',
      args: [],
    );
  }

  /// `Feed Plants`
  String get feed_plants {
    return Intl.message('Feed Plants', name: 'feed_plants', desc: '', args: []);
  }

  /// `Refresh Litter Box`
  String get refresh_litter_box {
    return Intl.message(
      'Refresh Litter Box',
      name: 'refresh_litter_box',
      desc: '',
      args: [],
    );
  }

  /// `Change Tank Water`
  String get change_tank_water {
    return Intl.message(
      'Change Tank Water',
      name: 'change_tank_water',
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
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'ms'),
      Locale.fromSubtags(languageCode: 'pl'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'th'),
      Locale.fromSubtags(languageCode: 'tr'),
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
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
