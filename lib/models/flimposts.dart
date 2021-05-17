import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flimmer/models/flim_model.dart';

class PostsModel {
  Stream<List<Msg>> stream;
  bool hasMore;

  bool _isLoading;
  List<Msg> _data;
  StreamController<List<Msg>> _controller;

  PostsModel() {
    _data = [];
    _controller = StreamController<List<Msg>>.broadcast();
    _isLoading = false;
    stream = _controller.stream;
    hasMore = true;
    refresh();
  }

  Future<void> fetchten(String id) async {
    // await Provider.of<Msg>(context, listen: false).fetchAndSetProducts();
    Dio dio = Dio();
    var response;
    try {
      if (id == null) {
        response = await dio.get(
          'https://flutter-autho.herokuapp.com/nextten',
          options: Options(
            headers: {},
          ),
        );
      } else {
        response = await dio.get(
          'https://flutter-autho.herokuapp.com/nextten',
          options: Options(
            headers: {
              'id': id,
            },
          ),
        );
      }
    } on DioError catch (e) {
      print(e.toString());
      return;
    }
    var extractedData = jsonDecode(response.toString()) as Map<String, dynamic>;

    print(extractedData.values.elementAt(1).length);
    hasMore = extractedData.values.elementAt(1).length > 0;
    extractedData.values.elementAt(1).forEach(
      (value) {
        _data.add(
          Msg(
            userId: value['userId'],
            flimBody: value['flimBody'],
            likes: value['likes'] as int,
            movieId: value['movieId'],
            moviePoster: value['moviePoster'],
            movieTitle: value['movieTitle'],
            movieYear: value['movieYear'],
            sId: value['_id'],
            // createdAt: value['createdAt'] as DateTime,
          ),
        );
      },
    );

    // print(response['msg'][0]);
    return;
  }

  Future<void> refresh() {
    return loadMore(clearCachedData: true);
  }

  Future<void> loadMore({bool clearCachedData = false}) async {
    if (clearCachedData) {
      _data = [];
      hasMore = true;
    }
    if (_isLoading || !hasMore) {
      return Future.value();
    }
    _isLoading = true;

    if (_data.length == 0) {
      await fetchten(null);
    } else {
      await fetchten(_data[_data.length - 1].sId);
    }
    _isLoading = false;

    _controller.add(_data);

    // _getExampleServerData(10).then((postsData) {
    //   _isLoading = false;
    //   _data.addAll(postsData);
    //   hasMore = (_data.length < 30);
    //   _controller.add(_data);
    // });

    return Future.value();
  }
}
