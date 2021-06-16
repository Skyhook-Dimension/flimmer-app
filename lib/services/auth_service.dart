import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Authservice {
  Dio dio = new Dio();

  login(name, password) async {
    try {
      return await dio.post(
        'https://flutter-autho.herokuapp.com/authenticate',
        data: {'name': name, 'password': password},
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
    } on DioError catch (e) {
      print(e.toString());
      //ScaffoldMessenger.of(context).showSnackBar(snackBar)
      //return e.response;
    }
  }

  signUp(name, password) async {
    try {
      return await dio.post(
        'https://flutter-autho.herokuapp.com/adduser',
        data: {'name': name, 'password': password},
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
    } on DioError catch (e) {
      print(e.toString());
      //ScaffoldMessenger.of(context).showSnackBar(snackBar)
      // return e.response;
    }
  }

  getInfo(token) async {
    try {
      return await dio.get(
        'https://flutter-autho.herokuapp.com/getinfo',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${token}',
          },
        ),
      );
    } on DioError catch (e) {
      print(e.toString());
    }
  }
}
