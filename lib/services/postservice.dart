import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flimmer/models/flim_model.dart';
import 'package:flutter/material.dart';

class PostService {
  Dio dio = new Dio();
  Future<String> postflim(Msg flim) async {
    try {
      var response = await dio.post(
        'https://flutter-autho.herokuapp.com/addflim',
        data: {
          'flimBody': flim.flimBody,
          'likes': flim.likes,
          'movieId': flim.movieId,
          'userId': 'qsq',
          'movieTitle': flim.movieTitle,
          'movieYear': flim.movieYear,
          'moviePoster': flim.moviePoster,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      print(response.toString());
      final extractedData = jsonDecode(response.toString());
      return "Your Flim has been posted";
    } on DioError catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
