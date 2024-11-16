import 'easy_date_timeline_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class EasyDateTimelineLocalizationsPt extends EasyDateTimelineLocalizations {
  EasyDateTimelineLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get okButtonLabel => 'OK';

  @override
  String get cancelButtonLabel => 'Cancelar';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class EasyDateTimelineLocalizationsPtBr
    extends EasyDateTimelineLocalizationsPt {
  EasyDateTimelineLocalizationsPtBr() : super('pt_BR');

  @override
  String get okButtonLabel => 'OK';

  @override
  String get cancelButtonLabel => 'Cancelar';
}
