import 'dart:convert';
<<<<<<< HEAD

=======
import 'dart:io';
>>>>>>> b0547a5fd096d2c8e1a331ac7a15e1adbfd2a8c7

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class OmdbApi {
  Dio dio = new Dio();

<<<<<<< HEAD
  final List<MovieModel> loadedMovies = [];
  Future<List<MovieModel>> searchMovie(String name) async {
    final url = Uri.parse('http://www.omdbapi.com/?apikey=e6aefcb6&s=$name');

=======
  Future<List<MovieModel>> searchMovie(String name) async {
    final url = Uri.parse('http://www.omdbapi.com/?apikey=e6aefcb6&s=$name');
    final List<MovieModel> loadedMovies = [];
>>>>>>> b0547a5fd096d2c8e1a331ac7a15e1adbfd2a8c7
    try {
      final response = await http.get(
        url,
      );
      final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
<<<<<<< HEAD
      print(response.body);
      extractedData.values.elementAt(0).forEach(
        (key, value) {
=======
      print(extractedData.values.elementAt(0)[0]);
      extractedData.values.elementAt(0).forEach(
        (value) {
>>>>>>> b0547a5fd096d2c8e1a331ac7a15e1adbfd2a8c7
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
