import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen({Key key}) : super(key: key);
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Feed",
          style: TextStyle(color: Theme.of(context).primaryColorDark),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 180.0,
              color: Colors.redAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: double.infinity,
                          height: 50.0,
                          color: Colors.white,
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 5.0),
                            child: Text(
                              "Categories",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Theme.of(context).primaryColorDark),
                            ),
                          ))
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 443.0,
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("Latest Articles"),
                        ],
                      )
                    ],
                  ),
                  Column()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
