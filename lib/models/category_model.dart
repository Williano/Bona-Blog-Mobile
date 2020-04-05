import 'package:flutter/foundation.dart';

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
      this.dateCreatedOn,
      this.dateUpdatedOn,
      this.timeCreatedOn,
      this.timeUpdatedOn})
      : assert(name != null),
        assert(imageURL != null);
  // assert(dateCreatedOn != null),
  // assert(dateUpdatedOn != null),
  // assert(timeCreatedOn != null),
  // assert(timeUpdatedOn != null);

  @override
  String toString() => "$name";

  static List<Category> getAllCategories() => [
        Category(
          name: "Sports",
          imageURL: "assets/images/SPORTS.jpg",
        ),
        Category(
          name: "Art",
          imageURL: "assets/images/art.jpg",
        ),
        Category(
          name: "Politics",
          imageURL: "assets/images/politics.jpg",
        ),
        Category(
          name: "Entertainment",
          imageURL: "assets/images/Entertainment.jpg",
        ),
        Category(
          name: "Programming",
          imageURL: "assets/images/programming.jpg",
        ),
        Category(
          name: "Food",
          imageURL: "assets/images/food.jpg",
        ),
        Category(
          name: "Software Engineering ",
          imageURL: "assets/images/se.jpg",
        ),
        Category(
          name: "Design",
          imageURL: "assets/images/design.jpg",
        ),
        Category(
          name: "Sports",
          imageURL: "assets/images/SPORTS.jpg",
        ),
        Category(
          name: "Art",
          imageURL: "assets/images/art.jpg",
        ),
        Category(
          name: "Politics",
          imageURL: "assets/images/politics.jpg",
        ),
        Category(
          name: "Entertainment",
          imageURL: "assets/images/Entertainment.jpg",
        ),
        Category(
          name: "Programming",
          imageURL: "assets/images/programming.jpg",
        ),
        Category(
          name: "Food",
          imageURL: "assets/images/food.jpg",
        ),
        Category(
          name: "Software Engineering",
          imageURL: "assets/images/se.jpg",
        ),
        Category(
          name: "Design",
          imageURL: "assets/images/design.jpg",
        ),
      ];
}
