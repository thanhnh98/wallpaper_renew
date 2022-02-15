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

  /// `Select one`
  String get select_one {
    return Intl.message(
      'Select one',
      name: 'select_one',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get info {
    return Intl.message(
      'Info',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `Options`
  String get options {
    return Intl.message(
      'Options',
      name: 'options',
      desc: '',
      args: [],
    );
  }

  /// `Photo by `
  String get photo_by {
    return Intl.message(
      'Photo by ',
      name: 'photo_by',
      desc: '',
      args: [],
    );
  }

  /// `Contact `
  String get contact {
    return Intl.message(
      'Contact ',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Lock Screen`
  String get lock_screen {
    return Intl.message(
      'Lock Screen',
      name: 'lock_screen',
      desc: '',
      args: [],
    );
  }

  /// `Home Screen`
  String get home_screen {
    return Intl.message(
      'Home Screen',
      name: 'home_screen',
      desc: '',
      args: [],
    );
  }

  /// `Both Screens`
  String get both_screens {
    return Intl.message(
      'Both Screens',
      name: 'both_screens',
      desc: '',
      args: [],
    );
  }

  /// `Curated`
  String get curated {
    return Intl.message(
      'Curated',
      name: 'curated',
      desc: '',
      args: [],
    );
  }

  /// `Animal`
  String get animal {
    return Intl.message(
      'Animal',
      name: 'animal',
      desc: '',
      args: [],
    );
  }

  /// `Nature`
  String get nature {
    return Intl.message(
      'Nature',
      name: 'nature',
      desc: '',
      args: [],
    );
  }

  /// `School`
  String get school {
    return Intl.message(
      'School',
      name: 'school',
      desc: '',
      args: [],
    );
  }

  /// `Text`
  String get text {
    return Intl.message(
      'Text',
      name: 'text',
      desc: '',
      args: [],
    );
  }

  /// `Travel`
  String get travel {
    return Intl.message(
      'Travel',
      name: 'travel',
      desc: '',
      args: [],
    );
  }

  /// `Traffic`
  String get traffic {
    return Intl.message(
      'Traffic',
      name: 'traffic',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get random {
    return Intl.message(
      'Country',
      name: 'random',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get mobile {
    return Intl.message(
      'Mobile',
      name: 'mobile',
      desc: '',
      args: [],
    );
  }

  /// `Photos`
  String get photo {
    return Intl.message(
      'Photos',
      name: 'photo',
      desc: '',
      args: [],
    );
  }

  /// `Videos`
  String get video {
    return Intl.message(
      'Videos',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `Search photo...`
  String get search {
    return Intl.message(
      'Search photo...',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Coming soon`
  String get waiting_feature_message {
    return Intl.message(
      'Coming soon',
      name: 'waiting_feature_message',
      desc: '',
      args: [],
    );
  }

  /// `Wallpaper HD - Quickly and Easy`
  String get app_slogan {
    return Intl.message(
      'Wallpaper HD - Quickly and Easy',
      name: 'app_slogan',
      desc: '',
      args: [],
    );
  }

  /// `Searching is easy`
  String get slogan_search {
    return Intl.message(
      'Searching is easy',
      name: 'slogan_search',
      desc: '',
      args: [],
    );
  }

  /// `Favorite photos`
  String get favourite_list {
    return Intl.message(
      'Favorite photos',
      name: 'favourite_list',
      desc: '',
      args: [],
    );
  }

  /// `Let's discover and save bunch of moments. <3`
  String get favourite_photo_des {
    return Intl.message(
      'Let\'s discover and save bunch of moments. <3',
      name: 'favourite_photo_des',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, nothing matches with keyword, please use other one T_T`
  String get empty_title {
    return Intl.message(
      'Sorry, nothing matches with keyword, please use other one T_T',
      name: 'empty_title',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get try_again {
    return Intl.message(
      'Try again',
      name: 'try_again',
      desc: '',
      args: [],
    );
  }

  /// `Give a second...`
  String get give_a_cond {
    return Intl.message(
      'Give a second...',
      name: 'give_a_cond',
      desc: '',
      args: [],
    );
  }

  /// `New year`
  String get landing_title_tet {
    return Intl.message(
      'New year',
      name: 'landing_title_tet',
      desc: '',
      args: [],
    );
  }

  /// `Motor`
  String get motor_bike {
    return Intl.message(
      'Motor',
      name: 'motor_bike',
      desc: '',
      args: [],
    );
  }

  /// `Download app at:`
  String get download_now {
    return Intl.message(
      'Download app at:',
      name: 'download_now',
      desc: '',
      args: [],
    );
  }

  /// `Share this photo`
  String get share_now {
    return Intl.message(
      'Share this photo',
      name: 'share_now',
      desc: '',
      args: [],
    );
  }

  /// `Result for `
  String get result_for {
    return Intl.message(
      'Result for ',
      name: 'result_for',
      desc: '',
      args: [],
    );
  }

  /// `Searching for `
  String get searching_text {
    return Intl.message(
      'Searching for ',
      name: 'searching_text',
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
