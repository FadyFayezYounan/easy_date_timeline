import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'easy_date_timeline_localizations_ar.dart';
import 'easy_date_timeline_localizations_az.dart';
import 'easy_date_timeline_localizations_bn.dart';
import 'easy_date_timeline_localizations_bs.dart';
import 'easy_date_timeline_localizations_cs.dart';
import 'easy_date_timeline_localizations_da.dart';
import 'easy_date_timeline_localizations_de.dart';
import 'easy_date_timeline_localizations_el.dart';
import 'easy_date_timeline_localizations_en.dart';
import 'easy_date_timeline_localizations_es.dart';
import 'easy_date_timeline_localizations_et.dart';
import 'easy_date_timeline_localizations_fa.dart';
import 'easy_date_timeline_localizations_fi.dart';
import 'easy_date_timeline_localizations_fr.dart';
import 'easy_date_timeline_localizations_gl.dart';
import 'easy_date_timeline_localizations_he.dart';
import 'easy_date_timeline_localizations_hi.dart';
import 'easy_date_timeline_localizations_hr.dart';
import 'easy_date_timeline_localizations_hu.dart';
import 'easy_date_timeline_localizations_hy.dart';
import 'easy_date_timeline_localizations_id.dart';
import 'easy_date_timeline_localizations_it.dart';
import 'easy_date_timeline_localizations_ja.dart';
import 'easy_date_timeline_localizations_ka.dart';
import 'easy_date_timeline_localizations_kk.dart';
import 'easy_date_timeline_localizations_ko.dart';
import 'easy_date_timeline_localizations_lt.dart';
import 'easy_date_timeline_localizations_lv.dart';
import 'easy_date_timeline_localizations_mk.dart';
import 'easy_date_timeline_localizations_mn.dart';
import 'easy_date_timeline_localizations_ms.dart';
import 'easy_date_timeline_localizations_nl.dart';
import 'easy_date_timeline_localizations_no.dart';
import 'easy_date_timeline_localizations_pl.dart';
import 'easy_date_timeline_localizations_pt.dart';
import 'easy_date_timeline_localizations_ro.dart';
import 'easy_date_timeline_localizations_ru.dart';
import 'easy_date_timeline_localizations_sk.dart';
import 'easy_date_timeline_localizations_sl.dart';
import 'easy_date_timeline_localizations_sq.dart';
import 'easy_date_timeline_localizations_sr.dart';
import 'easy_date_timeline_localizations_sv.dart';
import 'easy_date_timeline_localizations_th.dart';
import 'easy_date_timeline_localizations_tr.dart';
import 'easy_date_timeline_localizations_uk.dart';
import 'easy_date_timeline_localizations_ur.dart';
import 'easy_date_timeline_localizations_uz.dart';
import 'easy_date_timeline_localizations_vi.dart';
import 'easy_date_timeline_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of EasyDateTimelineLocalizations
/// returned by `EasyDateTimelineLocalizations.of(context)`.
///
/// Applications need to include `EasyDateTimelineLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/easy_date_timeline_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: EasyDateTimelineLocalizations.localizationsDelegates,
///   supportedLocales: EasyDateTimelineLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the EasyDateTimelineLocalizations.supportedLocales
/// property.
abstract class EasyDateTimelineLocalizations {
  EasyDateTimelineLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static EasyDateTimelineLocalizations? of(BuildContext context) {
    return Localizations.of<EasyDateTimelineLocalizations>(
        context, EasyDateTimelineLocalizations);
  }

  static const LocalizationsDelegate<EasyDateTimelineLocalizations> delegate =
      _EasyDateTimelineLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('az'),
    Locale('bn'),
    Locale('bs'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('et'),
    Locale('fa'),
    Locale('fi'),
    Locale('fr'),
    Locale('gl'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('hy'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ka'),
    Locale('kk'),
    Locale('ko'),
    Locale('lt'),
    Locale('lv'),
    Locale('mk'),
    Locale('mn'),
    Locale('ms'),
    Locale('nl'),
    Locale('no'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('ro'),
    Locale('ru'),
    Locale('sk'),
    Locale('sl'),
    Locale('sq'),
    Locale('sr'),
    Locale('sv'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('ur'),
    Locale('uz'),
    Locale('vi'),
    Locale('zh'),
    Locale('zh', 'HK'),
    Locale('zh', 'TW')
  ];

  /// Label for the OK button.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get okButtonLabel;

  /// Label for the Cancel button.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButtonLabel;
}

class _EasyDateTimelineLocalizationsDelegate
    extends LocalizationsDelegate<EasyDateTimelineLocalizations> {
  const _EasyDateTimelineLocalizationsDelegate();

  @override
  Future<EasyDateTimelineLocalizations> load(Locale locale) {
    return SynchronousFuture<EasyDateTimelineLocalizations>(
        lookupEasyDateTimelineLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'az',
        'bn',
        'bs',
        'cs',
        'da',
        'de',
        'el',
        'en',
        'es',
        'et',
        'fa',
        'fi',
        'fr',
        'gl',
        'he',
        'hi',
        'hr',
        'hu',
        'hy',
        'id',
        'it',
        'ja',
        'ka',
        'kk',
        'ko',
        'lt',
        'lv',
        'mk',
        'mn',
        'ms',
        'nl',
        'no',
        'pl',
        'pt',
        'ro',
        'ru',
        'sk',
        'sl',
        'sq',
        'sr',
        'sv',
        'th',
        'tr',
        'uk',
        'ur',
        'uz',
        'vi',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_EasyDateTimelineLocalizationsDelegate old) => false;
}

EasyDateTimelineLocalizations lookupEasyDateTimelineLocalizations(
    Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return EasyDateTimelineLocalizationsPtBr();
        }
        break;
      }
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'HK':
            return EasyDateTimelineLocalizationsZhHk();
          case 'TW':
            return EasyDateTimelineLocalizationsZhTw();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return EasyDateTimelineLocalizationsAr();
    case 'az':
      return EasyDateTimelineLocalizationsAz();
    case 'bn':
      return EasyDateTimelineLocalizationsBn();
    case 'bs':
      return EasyDateTimelineLocalizationsBs();
    case 'cs':
      return EasyDateTimelineLocalizationsCs();
    case 'da':
      return EasyDateTimelineLocalizationsDa();
    case 'de':
      return EasyDateTimelineLocalizationsDe();
    case 'el':
      return EasyDateTimelineLocalizationsEl();
    case 'en':
      return EasyDateTimelineLocalizationsEn();
    case 'es':
      return EasyDateTimelineLocalizationsEs();
    case 'et':
      return EasyDateTimelineLocalizationsEt();
    case 'fa':
      return EasyDateTimelineLocalizationsFa();
    case 'fi':
      return EasyDateTimelineLocalizationsFi();
    case 'fr':
      return EasyDateTimelineLocalizationsFr();
    case 'gl':
      return EasyDateTimelineLocalizationsGl();
    case 'he':
      return EasyDateTimelineLocalizationsHe();
    case 'hi':
      return EasyDateTimelineLocalizationsHi();
    case 'hr':
      return EasyDateTimelineLocalizationsHr();
    case 'hu':
      return EasyDateTimelineLocalizationsHu();
    case 'hy':
      return EasyDateTimelineLocalizationsHy();
    case 'id':
      return EasyDateTimelineLocalizationsId();
    case 'it':
      return EasyDateTimelineLocalizationsIt();
    case 'ja':
      return EasyDateTimelineLocalizationsJa();
    case 'ka':
      return EasyDateTimelineLocalizationsKa();
    case 'kk':
      return EasyDateTimelineLocalizationsKk();
    case 'ko':
      return EasyDateTimelineLocalizationsKo();
    case 'lt':
      return EasyDateTimelineLocalizationsLt();
    case 'lv':
      return EasyDateTimelineLocalizationsLv();
    case 'mk':
      return EasyDateTimelineLocalizationsMk();
    case 'mn':
      return EasyDateTimelineLocalizationsMn();
    case 'ms':
      return EasyDateTimelineLocalizationsMs();
    case 'nl':
      return EasyDateTimelineLocalizationsNl();
    case 'no':
      return EasyDateTimelineLocalizationsNo();
    case 'pl':
      return EasyDateTimelineLocalizationsPl();
    case 'pt':
      return EasyDateTimelineLocalizationsPt();
    case 'ro':
      return EasyDateTimelineLocalizationsRo();
    case 'ru':
      return EasyDateTimelineLocalizationsRu();
    case 'sk':
      return EasyDateTimelineLocalizationsSk();
    case 'sl':
      return EasyDateTimelineLocalizationsSl();
    case 'sq':
      return EasyDateTimelineLocalizationsSq();
    case 'sr':
      return EasyDateTimelineLocalizationsSr();
    case 'sv':
      return EasyDateTimelineLocalizationsSv();
    case 'th':
      return EasyDateTimelineLocalizationsTh();
    case 'tr':
      return EasyDateTimelineLocalizationsTr();
    case 'uk':
      return EasyDateTimelineLocalizationsUk();
    case 'ur':
      return EasyDateTimelineLocalizationsUr();
    case 'uz':
      return EasyDateTimelineLocalizationsUz();
    case 'vi':
      return EasyDateTimelineLocalizationsVi();
    case 'zh':
      return EasyDateTimelineLocalizationsZh();
  }

  throw FlutterError(
      'EasyDateTimelineLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
