import 'easy_date_timeline_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class EasyDateTimelineLocalizationsZh extends EasyDateTimelineLocalizations {
  EasyDateTimelineLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get okButtonLabel => '确定';

  @override
  String get cancelButtonLabel => '取消';
}

/// The translations for Chinese, as used in Hong Kong (`zh_HK`).
class EasyDateTimelineLocalizationsZhHk
    extends EasyDateTimelineLocalizationsZh {
  EasyDateTimelineLocalizationsZhHk() : super('zh_HK');

  @override
  String get okButtonLabel => '確定';

  @override
  String get cancelButtonLabel => '取消';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class EasyDateTimelineLocalizationsZhTw
    extends EasyDateTimelineLocalizationsZh {
  EasyDateTimelineLocalizationsZhTw() : super('zh_TW');

  @override
  String get okButtonLabel => '確定';

  @override
  String get cancelButtonLabel => '取消';
}
