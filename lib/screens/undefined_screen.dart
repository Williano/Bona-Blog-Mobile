import 'package:bona_blog/screens/feed_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class UndefinedScreen extends StatelessWidget {
  final String name;

  const UndefinedScreen({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "$name Not Found",
          style: TextStyle(color: Theme.of(context).primaryColorLight),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/error3.jpg"),
                    fit: BoxFit.fill)),
          ),
          Container(
            color: Theme.of(context).primaryColorDark.withOpacity(0.3),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Route for $name is not defined",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColorLight),
                  textAlign: TextAlign.center,
                ),
                Center(
                  child: RaisedButton.icon(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () {
                        pushNewScreen(
                          context,
                          screen: FeedScreen(),
                        );
                      },
                      color: Theme.of(context).buttonColor,
                      icon: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Return To Feed",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      )),
                )
              ]),
        ],
      ),
    );
  }
}
