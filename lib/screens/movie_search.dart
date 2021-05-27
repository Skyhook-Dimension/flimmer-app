import 'package:flimmer/app/movie_search_delegate.dart';
import 'package:flimmer/models/movie_model.dart';
import 'package:flimmer/services/movie_search_service.dart';
import 'package:flimmer/services/omdb_api.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieSearch extends StatelessWidget {
  static const routeName = '/searchfilms';
  void _showSearch(BuildContext context) async {
    final searchService = MovieSearchService(apiWrapper: OmdbApi());
    final user = await showSearch<MovieModel>(
      context: context,
      delegate: MovieSearchDelegate(searchService),
    );
    searchService.dispose();
    print('user');
    print(user.imdbID);
    print('user');
  }

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
          onPressed: () => _showSearch(context),
        ),
      ),
    );
  }
}
