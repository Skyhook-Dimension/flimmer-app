import 'package:flutter/foundation.dart';

class Msg {
  int likes;
  String sId;
  String userId;
  String flimBody;
  String movieTitle;
  String moviePoster;
  String movieYear;
  String movieId;

  Msg({
    this.likes,
    this.sId,
    @required this.userId,
    @required this.flimBody,
    this.movieTitle,
    this.moviePoster,
    this.movieYear,
    this.movieId,
  });
}
