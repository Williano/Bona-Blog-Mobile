import 'package:bona_blog/utilities/custom_material_colors_utils.dart';
import 'package:bona_blog/utilities/route_constants_utils.dart';
import 'package:flutter/material.dart';

class UndefinedScreen extends StatelessWidget {
  final String name;

  const UndefinedScreen({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text("$name Not Found"),
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
            color: Colors.black.withOpacity(0.3),
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
                        Navigator.pushReplacementNamed(
                            context, HomeScreenRoute);
                      },
                      color: customColor,
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
