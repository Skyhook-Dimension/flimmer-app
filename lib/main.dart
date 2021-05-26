import 'package:flimmer/screens/home.dart';
import 'package:flimmer/screens/profilepage.dart';
import 'package:flutter/material.dart';
import './screens/loginpage.dart';
import './screens/dashboard.dart';
import './screens/createflims.dart';

import './screens/moviesearch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flimmer",
      home: Home(),
      debugShowCheckedModeBanner: false,
      routes: {
        Dashboard.routeName: (ctx) => Dashboard(),
        CreateFlims.routeName: (ctx) => CreateFlims(),
        MovieSearch.routeName: (ctx) => MovieSearch(),
        UserProfilePage.routeName: (ctx) => UserProfilePage(),
      },
    );
  }
}
