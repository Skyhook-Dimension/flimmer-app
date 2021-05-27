import 'package:dio/dio.dart';
import 'package:flimmer/models/flim_posts.dart';
import 'package:flimmer/screens/create_flims.dart';
import 'package:flutter/material.dart';

class FlimsFeed extends StatefulWidget {
  static const routeName = '/FlimsFeed';
  @override
  _FlimsFeedState createState() => _FlimsFeedState();
}

class _FlimsFeedState extends State<FlimsFeed> {
  PostsModel _posts;
  Dio dio = new Dio();
  Future<void> _refreshFlims(BuildContext context) async {
    _posts.refresh();

    return;
    // await Provider.of<Msg>(context, listen: false).fetchAndSetProducts();
  }

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
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     Navigator.of(context).pushNamed(CreateFlims.routeName);
        //   },
        //   child: Icon(Icons.movie_filter_rounded),
        // ),
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
