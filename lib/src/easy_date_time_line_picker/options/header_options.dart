import '../enums/enums.exports.dart';
import '../utils/utils.exports.dart';

final class HeaderOptions {
  /// Options for customizing the header of the date timeline picker.
  ///
  /// If both [headerType] and [headerBuilder] are provided, [headerBuilder] takes precedence.
  const HeaderOptions({
    this.headerType = HeaderType.picker,
    this.headerBuilder,
  });

  /// {@template header_type}
  /// An enumeration representing the different types of header behaviors
  /// that can be applied in the date timeline picker.
  ///
  /// This enum is used to define how the header of the date timeline picker
  /// should behave or be displayed. Each value in this enum corresponds to
  /// a specific behavior or display type for the header.
  /// ```dart
  /// EasyDateTimeLinePicker(
  ///   ...
  ///   headerType: HeaderType.picker,
  /// )
  ///   ```
  /// The available header types are:
  ///
  /// - `viewOnly`: A header that is used for display purposes only.
  /// - `picker`: A header that allows the user to pick a date.
  /// - `none`: No header is displayed.
  /// {@endtemplate}
  final HeaderType headerType;

  /// {@template header_builder}
  /// Custom builder for the header of the picker.
  /// ```dart
  /// EasyDateTimeLinePicker(
  ///  ...
  /// headerBuilder: (context, date, onTap) {
  ///  return InkWell(
  ///   onTap: onTap,
  ///  child: Text(
  ///   DateFormat.yMMMM().format(date),
  /// ),
  /// );
  /// ```
  /// {@endtemplate}
  final EasyPickerHeaderBuilderCallBack? headerBuilder;

  @override
  String toString() =>
      'HeaderOptions(headerType: $headerType, headerBuilder: $headerBuilder)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HeaderOptions &&
          runtimeType == other.runtimeType &&
          headerType == other.headerType &&
          headerBuilder == other.headerBuilder;

  @override
  int get hashCode => headerType.hashCode ^ headerBuilder.hashCode;
}
