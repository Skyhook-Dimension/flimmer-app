import 'package:flutter/material.dart';
import './screens/loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flimmer Auth",
      home: LoginPage(),
    );
  }
}
