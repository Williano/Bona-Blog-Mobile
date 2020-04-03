import 'package:flutter/cupertino.dart';

class Category {
  String name;
  String imageURL;
  String dateCreatedOn;
  String dateUpdatedOn;
  String timeCreatedOn;
  String timeUpdatedOn;

  Category(
      {@required this.name,
      @required this.imageURL,
      @required this.dateCreatedOn,
      @required this.dateUpdatedOn,
      @required this.timeCreatedOn,
      @required this.timeUpdatedOn})
      : assert(name != null),
        assert(imageURL != null),
        assert(dateCreatedOn != null),
        assert(dateUpdatedOn != null),
        assert(timeCreatedOn != null),
        assert(timeUpdatedOn != null);

  @override
  String toString() => "$name";
}
