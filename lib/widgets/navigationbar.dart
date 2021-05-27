import 'package:flutter/material.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../screens/dashboard.dart';
import '../screens/profilepage.dart';
import '../screens/createflims.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    UserProfilePage(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SpinCircleBottomBarHolder(
      bottomNavigationBar: SCBottomBarDetails(
          circleColors: [Colors.white, Colors.orange, Colors.redAccent],
          iconTheme: IconThemeData(color: Colors.black45),
          activeIconTheme: IconThemeData(color: Colors.orange),
          backgroundColor: Colors.white,
          titleStyle: TextStyle(color: Colors.black45, fontSize: 12),
          activeTitleStyle: TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
          actionButtonDetails: SCActionButtonDetails(
              color: Colors.redAccent,
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              elevation: 2),
          elevation: 2.0,
          items: [
            // Suggested count : 4
            SCBottomBarItem(
              icon: Icons.verified_user,
              title: "User",
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                  print(_selectedIndex);
                });
              },
            ),
            SCBottomBarItem(
              icon: Icons.supervised_user_circle,
              title: "Details",
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                  print(_selectedIndex);
                });
              },
            ),
            SCBottomBarItem(
              icon: Icons.notifications,
              title: "Notifications",
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                  print(_selectedIndex);
                });
              },
            ),
            SCBottomBarItem(
              icon: Icons.details,
              title: "New Data",
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;
                  print(_selectedIndex);
                });
              },
            ),
          ],
          circleItems: [
            //Suggested Count: 3
            SCItem(
              icon: Icon(Icons.movie),
              onPressed: () {
                Navigator.of(context).pushNamed(CreateFlims.routeName);
              },
            ),
            SCItem(
              icon: Icon(Entypo.open_book),
              onPressed: () {},
            ),
            //SCItem(icon: Icon(Icons.map), onPressed: () {}),
          ],
          bnbHeight: 80 // Suggested Height 80
          ),
      child: Container(
        color: Colors.orangeAccent.withAlpha(55),
        child: Center(
          child: _widgetOptions[_selectedIndex],
        ),
      ),
    );
  }
}
