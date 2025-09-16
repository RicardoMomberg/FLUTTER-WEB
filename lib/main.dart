import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(
    apiKey: "AIzaSyDJizeC0HVv5OBFW_1UYt_7zaxDO4Wjln0",
    appId: "1:170284411810:web:682c38225626785019e0fb",
    messagingSenderId: "170284411810", 
    projectId: "image-gallery-web-97022",
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image gallery app',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image gallery web'),
        ),
        body: Center(
          child: Text('Firebase initialized successfully!'),
        ),
      ),
    );
  }
}
