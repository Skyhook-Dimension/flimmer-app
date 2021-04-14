import 'package:flutter/material.dart';
import '../services/authservice.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flimmer Movie Search'),
      ),
      body: Center(
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          child: Text('Search',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white)),
          // onPressed: () => _showSearch(context),
        ),
      ),
    );
  }
}
