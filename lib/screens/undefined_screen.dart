import 'package:bona_blog/utilities/custom_material_color.dart';
import 'package:bona_blog/utilities/route_constants.dart';
import 'package:flutter/material.dart';

class UndefinedScreen extends StatelessWidget {
  final String name;

  UndefinedScreen({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("$name Not Found"),
        centerTitle: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Text(
              "Route for $name is not defined",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            )),
            Center(
              child: FlatButton.icon(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, HomeScreenRoute);
                  },
                  color: customColor,
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Return Home",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  )),
            )
          ]),
    );
  }
}
