import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_app/image_galley.dart';
import 'package:image_gallery_app/l10n/app_localizations.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
  ),
  textTheme: TextTheme(titleLarge: TextStyle(fontSize: 32, color: Colors.grey)),
);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
  ),
  textTheme: TextTheme(titleLarge: TextStyle(fontSize: 32, color: Colors.pink)),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDJizeC0HVv5OBFW_1UYt_7zaxDO4Wjln0",
      appId: "1:170284411810:web:682c38225626785019e0fb",
      messagingSenderId: "170284411810",
      projectId: "image-gallery-web-97022",
      storageBucket: "image-gallery-web-97022.firebasestorage.app",
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void setTheme(BuildContext context, ThemeData theme) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state?.changeTheme(theme);
  }

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state?.changeLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale = const Locale('pt');
  ThemeData _themeData = lightTheme;

  void changeTheme(ThemeData theme) {
    setState(() {
      _themeData = theme;
    });
  }

  void changeLocale(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image gallery app',
      home: ImageGallery(),
      locale: _locale,
      theme: _themeData,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
