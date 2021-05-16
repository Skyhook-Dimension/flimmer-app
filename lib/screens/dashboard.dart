import 'package:flimmer/models/flim_model.dart';
import 'package:flimmer/screens/createflims.dart';
import 'package:flutter/material.dart';
import '../services/authservice.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<void> _refreshFlims(BuildContext context) async {
    // await Provider.of<Msg>(context, listen: false).fetchAndSetProducts();
  }

  @override
  void initState() {
    // await Provider.of<Msg>(context, listen: false).fetchAndSetProducts();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var name = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(CreateFlims.routeName);
        },
        child: Icon(Icons.movie_filter_rounded),
      ),
      appBar: AppBar(title: Text('DashBoard')),
      body: RefreshIndicator(
        onRefresh: () => _refreshFlims(context),
        child: Padding(
            padding: EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, i) => Column(
                children: [
                  ListTile(
                    title: Text('HII'),
                  ),
                  Divider(),
                ],
              ),
            )),
      ),
    );
  }
}
