import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flimmer/models/flim_model.dart';
import 'package:flimmer/models/flimposts.dart';
import 'package:flimmer/screens/createflims.dart';
import 'package:flimmer/screens/profilepage.dart';
import 'package:flutter/material.dart';
import '../services/authservice.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PostsModel _posts;
  Dio dio = new Dio();
  Future<void> _refreshFlims(BuildContext context) async {
    _posts.refresh();
    return;
    // await Provider.of<Msg>(context, listen: false).fetchAndSetProducts();
  }

  // Future<void> fetchten(String id) async {
  //   // await Provider.of<Msg>(context, listen: false).fetchAndSetProducts();

  //   var response;
  //   try {
  //     if (id == null) {
  //       response = await dio.get(
  //         'https://flutter-autho.herokuapp.com/nextten',
  //         options: Options(
  //           headers: {},
  //         ),
  //       );
  //     } else {
  //       response = await dio.get(
  //         'https://flutter-autho.herokuapp.com/nextten',
  //         options: Options(
  //           headers: {
  //             'id': id,
  //           },
  //         ),
  //       );
  //     }
  //   } on DioError catch (e) {
  //     print(e.toString());
  //     return;
  //   }
  //   var extractedData = jsonDecode(response.toString()) as Map<String, dynamic>;

  //   print(extractedData.values.elementAt(1));

  //   extractedData.values.elementAt(1).forEach(
  //     (value) {
  //       flimitems.add(
  //         Msg(
  //           userId: value['userId'],
  //           flimBody: value['flimBody'],
  //           likes: value['likes'] as int,
  //           movieId: value['movieId'],
  //           moviePoster: value['moviePoster'],
  //           movieTitle: value['movieTitle'],
  //           movieYear: value['movieYear'],
  //           sId: value['_id'],
  //           // createdAt: value['createdAt'] as DateTime,
  //         ),
  //       );
  //     },
  //   );

  //   setState(() {});
  //   // print(response['msg'][0]);
  //   return;
  // }
  final scrollController = ScrollController();
  @override
  void initState() {
    // await Provider.of<Msg>(context, listen: false).fetchAndSetProducts();
    _posts = PostsModel();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        _posts.loadMore();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var name = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF6200EE),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (value) {
            if (value == 0) {
              ;
            } else if (value == 1) {
              Navigator.of(context).pushNamed(UserProfilePage.routeName);
            } else if (value == 2) {
              ;
            }
            // Respond to item press.
          },
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.account_circle_rounded),
            ),
            BottomNavigationBarItem(
              label: 'Logout',
              icon: Icon(Icons.exit_to_app),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(CreateFlims.routeName);
          },
          child: Icon(Icons.movie_filter_rounded),
        ),
        appBar: AppBar(title: Text('DashBoard')),
        body: StreamBuilder(
          stream: _posts.stream,
          builder: (BuildContext _context, AsyncSnapshot _snapshot) {
            if (!_snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return RefreshIndicator(
                onRefresh: () => _refreshFlims(context),
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  controller: scrollController,
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: _snapshot.data.length + 1,
                  itemBuilder: (BuildContext _context, int index) {
                    if (index < _snapshot.data.length) {
                      return ListTile(
                        leading: Image.network(
                          _snapshot.data[index].moviePoster ??
                              'https://i.stack.imgur.com/y9DpT.jpg',
                          width: 60.0,
                          height: 60.0,
                        ),
                        title: Text(_snapshot.data[index].flimBody),
                      );
                    } else if (_posts.hasMore) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 32.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 32.0),
                        child: Center(child: Text('nothing more to load!')),
                      );
                    }
                  },
                ),
              );
            }
          },
        ));
  }
}
