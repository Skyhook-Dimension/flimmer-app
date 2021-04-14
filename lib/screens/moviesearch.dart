<<<<<<< HEAD
=======
import 'package:flimmer/app/movie_search_delegate.dart';
import 'package:flimmer/models/movie_model.dart';
import 'package:flimmer/services/movie_search_service.dart';
import 'package:flimmer/services/omdb_api.dart';
>>>>>>> b0547a5fd096d2c8e1a331ac7a15e1adbfd2a8c7
import 'package:flutter/material.dart';
import '../services/authservice.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieSearch extends StatelessWidget {
<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
=======
 void _showSearch(BuildContext context) async {
    final searchService =
        MovieSearchService(apiWrapper: OmdbApi());
    final user = await showSearch<MovieModel>(
      context: context,
      delegate: MovieSearchDelegate(searchService),
    );
    searchService.dispose();
    print(user);
  }

 
  @override
  Widget build(BuildContext context) {
      return Scaffold(
>>>>>>> b0547a5fd096d2c8e1a331ac7a15e1adbfd2a8c7
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
<<<<<<< HEAD
          // onPressed: () => _showSearch(context),
=======
          onPressed: () => _showSearch(context),
>>>>>>> b0547a5fd096d2c8e1a331ac7a15e1adbfd2a8c7
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> b0547a5fd096d2c8e1a331ac7a15e1adbfd2a8c7
