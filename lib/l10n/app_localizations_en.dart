// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Image Gallery';

  @override
  String get select_image => 'Select Image';

  @override
  String get upload_image => 'Upload Image';

  @override
  String get no_image_selected => 'No image selected.';

  @override
  String get image_uploaded => 'Image uploaded successfully!';
}
