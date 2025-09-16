import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image gallery app',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text('Image Gallery 2')),
      body: Center(
        child: screenSize.width < 600
            ? Column(
                children: [
                  Text('Small screen layout'),
                  Image.network(
                    'https://www.combatarena.net/cdn/shop/articles/bjj.jpg?v=1695911535',
                  ),
                ],
              )
            : Column(
                children: [
                  Text('Large screen layout'),
                  Image.network(
                    'https://cdn.evolve-mma.com/wp-content/uploads/2015/05/why-bjj-is-the-perfect-martial-art.jpg',
                  ),
                ],
              ),
      ),
    );
  }
}
