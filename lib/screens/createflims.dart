import 'package:flimmer/app/movie_search_delegate.dart';
import 'package:flimmer/models/flim_model.dart';
import 'package:flimmer/models/movie_model.dart';
import 'package:flimmer/screens/moviesearch.dart';
import 'package:flimmer/services/movie_search_service.dart';
import 'package:flimmer/services/omdb_api.dart';
import 'package:flimmer/services/postservice.dart';
import 'package:flutter/material.dart';
import '../services/authservice.dart';

import 'package:flutter/material.dart';

class CreateFlims extends StatefulWidget {
  static const routeName = '/createflims';
  @override
  _CreateFlimsState createState() => _CreateFlimsState();
}

class _CreateFlimsState extends State<CreateFlims> {
  final _postservice = PostService();
  final _displaynameFocusNode = FocusNode();

  final _form = GlobalKey<FormState>();
  var _editedProduct = Msg(userId: 'userId', flimBody: 'flimBody');
  var _isInit = true;
  var _isLoading = false;
  var _initValues = {
    'displayname': '',
    'imageUrl': '',
  };
  var _ismovie = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _initValues = {
        'displayname': "_editedProduct.displayname",
        'imageUrl': "editedProduct.imageUrl",
      };
    }

    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _displaynameFocusNode.dispose();

    super.dispose();
  }

  void _showSearch(BuildContext context) async {
    final searchService = MovieSearchService(apiWrapper: OmdbApi());
    final result = await showSearch<MovieModel>(
      context: context,
      delegate: MovieSearchDelegate(searchService),
    );
    searchService.dispose();
    setState(() {
      _ismovie = true;
    });
    _editedProduct = Msg(
        userId: _editedProduct.userId,
        flimBody: _editedProduct.flimBody,
        moviePoster: result.poster,
        movieYear: result.year,
        likes: 0,
        movieTitle: result.title,
        movieId: result.imdbID);
    print('user');
    print(result.imdbID);
    print('user');
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });

    String msg = await _postservice.postflim(_editedProduct);

    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    // print(_editedProduct.description);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _saveForm();
            },
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: _initValues['Your Flim'],
                      decoration: InputDecoration(
                          labelText: 'Your Flim',
                          labelStyle: TextStyle(fontSize: 23)),
                      focusNode: _displaynameFocusNode,
                      maxLines: 3,
                      validator: (value) {
                        if (value.isEmpty) {
                          return " Please provide a description";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        _editedProduct = Msg(
                            userId: _editedProduct.userId,
                            flimBody: value,
                            moviePoster: _editedProduct.moviePoster,
                            movieYear: _editedProduct.movieYear,
                            likes: 0,
                            movieTitle: _editedProduct.movieTitle,
                            movieId: _editedProduct.movieId);
                      },
                    ),
                    !_ismovie
                        ? Container(
                            child: TextButton(
                              child: Text('Tag Movie'),
                              onPressed: () {
                                _showSearch(context);
                              },
                            ),
                          )
                        : Column(
                            children: [
                              ListTile(
                                leading: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            1.0)), //add border radius here
                                    child: _editedProduct.moviePoster == 'N/A'
                                        ? Container(
                                            width: 30,
                                            height: 50,
                                            color: Colors.amber,
                                          )
                                        : Image(
                                            image: NetworkImage(
                                                _editedProduct.moviePoster),
                                          ) //add image location here
                                    ),
                                title: Text(
                                    _editedProduct.movieTitle), // movie details
                                subtitle: Text(_editedProduct.movieYear),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete_outlined),
                                  onPressed: () {
                                    setState(() {
                                      _ismovie = false;
                                    });
                                  },
                                  iconSize: 30,
                                  color: Colors.red,
                                ), // movie details
                              ),
                            ],
                          )
                  ],
                ),
              ),
            ),
    );
  }
}
