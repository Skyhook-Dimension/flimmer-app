import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class OmdbApi {
  Dio dio = new Dio();

  Future<List<MovieModel>> searchMovie(String name) async {
    final url = Uri.parse('http://www.omdbapi.com/?apikey=e6aefcb6&s=$name');
    final List<MovieModel> loadedMovies = [];
    try {
      final response = await http.get(
        url,
      );
      final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
      print(extractedData.values.elementAt(0)[0]);
      extractedData.values.elementAt(0).forEach(
        (value) {
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
      print('Error ' + e.toString());
    }
    return loadedMovies;
  }
}
