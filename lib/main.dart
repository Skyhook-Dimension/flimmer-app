import 'package:flimmer/screens/home.dart';
import 'package:flimmer/screens/profile_page.dart';
import 'package:flutter/material.dart';

import './screens/create_flims.dart';

import './screens/movie_search.dart';
import './screens/flims_feed.dart';
import './screens/new_script.dart';

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
        FlimsFeed.routeName: (ctx) => FlimsFeed(),
        CreateFlims.routeName: (ctx) => CreateFlims(),
        MovieSearch.routeName: (ctx) => MovieSearch(),
        UserProfilePage.routeName: (ctx) => UserProfilePage(),
        NewScript.routeNamed: (ctx) => NewScript(),
      },
    );
  }
}
