import 'dart:convert';

import 'package:dio/dio.dart';
import '../models/movie_model.dart';

class OmdbApi {
  Dio dio = new Dio();

  final List<MovieModel> loadedMovies = [];
  Future<List<MovieModel>> searchMovie(String name) async {
    final url = 'http://www.omdbapi.com';
    try {
      final response = await dio.get(
        url,
        queryParameters: {
          'apikey': 'e6aefcb6',
          's': name,
        },
      );
      final extractedData = jsonDecode(response.data) as Map<String, dynamic>;
      //print(jsonDecode(response.data['Search'].toString()));
      print(extractedData['Search']);
      extractedData['Search'].forEach(
        (key, value) {
          loadedMovies.add(
            MovieModel(
              imdbID: value['imdbID'],
              poster: value['Poster'],
              title: value['Title'],
              type: value['Type'],
              year: value['Year'],
            ),
          );
        },
      );
      return loadedMovies;
    } catch (e) {
      print(e.toString());
    }
  }
}
