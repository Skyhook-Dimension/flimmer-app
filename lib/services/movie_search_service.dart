import 'dart:async';

import 'package:flimmer/models/movie_model.dart';
import 'package:flimmer/services/omdb_api.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

enum APIError { rateLimitExceeded }

class MovieSearchService {
  MovieSearchService({@required this.apiWrapper}) {
   
    _results = _searchTerms
        .debounce((_) => TimerStream(true, Duration(milliseconds: 250)))
        .switchMap((query) async* {
      print('searching: $query');
      yield await apiWrapper.searchMovie(query);
    }); // discard previous events
  }
  final OmdbApi apiWrapper;

  // Input stream (search terms)
  final _searchTerms = BehaviorSubject<String>();
  void searchMovie(String query) => _searchTerms.add(query);

  // Output stream (search results)
  Stream<List<MovieModel>> _results;
  Stream<List<MovieModel>> get results => _results;

  void dispose() {
    _searchTerms.close();
  }
}
