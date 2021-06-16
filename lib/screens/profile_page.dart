import 'package:flimmer/screens/flims_feed.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  // UserModel curruser;
  // List<Audio> list;
  int total;
  @override
  void initState() {
    // TODO: implement initState

    // curruser = Provider.of<AudioUser>(context, listen: false).user;
    // list =
    //     // Provider.of<Audios>(context, listen: false).countlikes(curruser.userid);
    // total = 0;
    // list.forEach((element) {
    //   setState(() {
    //     if (element.likedBy != null) {
    //       total = total + element.likedBy.length;
    //     } else {
    //       total = total + 0;
    //     }
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // curruser = Provider.of<AudioUser>(context).user;
    // list = Provider.of<Audios>(context).countlikes(curruser.userid);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple[800], Colors.deepPurpleAccent],
                    ),
                  ),
                  child: Column(children: [
                    Flexible(
                      flex: 1,
                      child: Container(),
                    ),
                    Flexible(
                      flex: 5,
                      child: CircleAvatar(
                          radius: 50.0,
                          // backgroundImage: NetworkImage(curruser.imageUrl != ''
                          //     ? curruser.imageUrl
                          //     : 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png')),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                        'demo display name'
                        // curruser.displayname
                        ,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        )),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.of(context)
                        //     .pushNamed(ProfileEditPage.routeName);
                        setState(() {});
                      },
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    )
                  ]),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.grey[200],
                  child: Center(
                      child: Card(
                          margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                          child: Container(
                              width: 360.0,
                              height: 290.0,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Information",
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey[300],
                                    ),
                                    // Expanded(
                                    //   // child: AudioLists(
                                    //   //   references: Provider.of<Audios>(context)
                                    //   //       .favitems(curruser.userid),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              )))),
                ),
              ),
            ],
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.320,
              left: 20.0,
              right: 20.0,
              child: Card(
                  child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        child: Column(
                      children: [
                        Text(
                          'Total Likes',
                          style: TextStyle(
                              color: Colors.grey[400], fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          total.toString(),
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        )
                      ],
                    )),
                    Container(
                      child: Column(children: [
                        Text(
                          "Total Posts",
                          style: TextStyle(
                              color: Colors.grey[400], fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '23',
                          // Provider.of<Audios>(context)
                          //     .countmy(curruser.userid)
                          //     .toString(),
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              )))
        ],
      ),
    );
  }
}
