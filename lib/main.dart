import 'package:flutter/material.dart';
import './screens/loginpage.dart';
import './screens/dashboard.dart';

import './screens/moviesearch.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flimmer Auth",

      home: MovieSearch(),
      routes: {
   Dashboard.routeName : (ctx)=> Dashboard()

      },

    );
  }
}
