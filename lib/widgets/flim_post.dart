import 'package:flutter/material.dart';

class AppPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: width / 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.2),
              blurRadius: 25,
              offset: Offset(0, 0),
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: width / 10,
                        width: width / 10,
                        child: FittedBox(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(width),

                            //   child: Container(
                            //     color: Colors.redAccent,
                            //     height: 200,
                            //     width: 200,
                            //   ),
                            child: Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width / 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Vikrant Kumar",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                          Text(
                            "1 min ago",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: width / 25,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: width / 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: width / 10,
                        width: width / 10,
                        child: FittedBox(
                          // child: Container(
                          //   height: (width / 10),
                          //   width: (width / 10),
                          //   color: Colors.red,
                          // ),

                          child: Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
                        ),
                      ),
                      SizedBox(
                        width: width / 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "The Metalist And The Hero",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.red),
                          ),
                          Text(
                            "TV Series (2013)",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.normal,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.redAccent.withOpacity(0.1),
                  ),
                  height: width / 10,
                ),
              ),
            ),
            SizedBox(
              height: width / 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    color: Colors.redAccent.withOpacity(0.1),
                    width: double.maxFinite,
                    child: FittedBox(
                      // child: Container(
                      //   height: (width / 10),
                      //   width: (width / 10),
                      //   color: Colors.red,
                      // ),

                      child: Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: width / 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      // if (post.isLiker(userID: '')) {
                      //   post.unlike(userID: '');
                      // } else {
                      //   post.like(userID: '');
                      // }
                    },
                    child: SizedBox(
                      height: width / 17,
                      width: width / 17,
                      child: FittedBox(
                        child: Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 30,
                  ),
                  InkWell(
                    onTap: () {
                      // post.addComment(userID: '', comment: '');
                    },
                    child: SizedBox(
                      height: width / 17,
                      width: width / 17,
                      child: FittedBox(
                        child: Icon(Icons.comment),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 30,
                  ),
                  SizedBox(
                    height: width / 17,
                    width: width / 17,
                    child: FittedBox(
                      child: Icon(Icons.send),
                    ),
                  ),
                  Spacer(),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "10 Comments",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.redAccent,
                        ),
                        // post.commentCount.toString() +
                        //     ' comment' +
                        //     ((post.commentCount > 1) ? ('s') : ('')),
                        // style: style.body.copyWith(color: color.style),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
