// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get title => 'Galeria de imagens';

  @override
  String get select_image => 'Selecionar imagem';

  @override
  String get upload_image => 'Enviar imagem';

  @override
  String get no_image_selected => 'Nenhuma imagem selecionada.';

  @override
  String get image_uploaded => 'Imagem enviada com sucesso!';
}
