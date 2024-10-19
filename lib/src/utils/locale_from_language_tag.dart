import 'package:flutter/material.dart';
import 'package:intl/locale.dart' as intl;

/// Converts a language tag into a [Locale] object.
///
/// If the provided [languageTag] is invalid or cannot be parsed,
/// a default [Locale] with the language code 'en' is returned.
///
/// - Parameter [languageTag]: A string representing the language tag.
/// - Returns: A [Locale] object corresponding to the parsed language tag,
///   or a default [Locale] with the language code 'en' if parsing fails.
Locale localeFromLanguageTag(String languageTag) {
  intl.Locale? basicLocale = intl.Locale.tryParse(languageTag);
  if (basicLocale == null) {
    return const Locale('en');
  } else {
    return Locale(
      basicLocale.languageCode,
      basicLocale.countryCode,
    );
  }
}

// Locale languageTagToLocale(String languageTag) {
//   try {
//     final parts = languageTag.split('-');
//     return Locale.fromSubtags(
//       languageCode: parts[0],
//       countryCode: parts.length > 1 ? parts[1] : null,
//       scriptCode: parts.length > 2 ? parts[2] : null,
//     );
//   } catch (e) {
//     print('Error parsing language tag: $e');
//     return const Locale('en'); // Default fallback
//   }
//}
