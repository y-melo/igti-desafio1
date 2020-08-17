import 'package:flutter/material.dart';

import './screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      const title = "Desafio 3 - Quiz";

    return MaterialApp(
      title: title,
      home: Home(title: title),
    );
  }
}

