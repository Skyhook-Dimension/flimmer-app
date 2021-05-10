import 'package:flimmer/screens/createflims.dart';
import 'package:flutter/material.dart';
import '../services/authservice.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var name = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(CreateFlims.routeName);
        },
        child: Icon(Icons.movie_filter_rounded),
      ),
      body: Container(
        child: Text('hello $name'),
      ),
    );
  }
}
