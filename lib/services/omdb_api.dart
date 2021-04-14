import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class OmdbApi {
  Dio dio = new Dio();

  final List<MovieModel> loadedMovies = [];
  Future<List<MovieModel>> searchMovie(String name) async {
    final url = Uri.parse('http://www.omdbapi.com/?apikey=e6aefcb6&s=$name');

    try {
      final response = await http.get(
        url,
      );
      final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
      print(response.body);
      extractedData.values.elementAt(0).forEach(
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
      print('Error ' + e.toString());
    }
    return loadedMovies;
  }
}
