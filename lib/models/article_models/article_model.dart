class ArticleModel {
  final int articleId;
  final String author;
  final String title;
  final String imageURL;
  final String category;
  final String body;
  final int numberOfViews;
  final int readTime;
  final String datePublishedOn;
  final String dateUpdatedOn;
  final String timePublishedOn;
  final String timeUpdatedOn;

  ArticleModel(
      {this.articleId,
      this.author,
      this.title,
      this.imageURL,
      this.category,
      this.body,
      this.numberOfViews,
      this.readTime,
      this.datePublishedOn,
      this.dateUpdatedOn,
      this.timePublishedOn,
      this.timeUpdatedOn})
      : assert(author != null),
        assert(title != null),
        assert(imageURL != null),
        assert(category != null),
        assert(body != null),
        assert(numberOfViews != null),
        assert(readTime != null);
  // assert(dateCreatedOn != null),
  // assert(dateUpdatedOn != null),
  // assert(timeCreatedOn != null),
  // assert(timeUpdatedOn != null);

  @override
  String toString() => "$title";

  static List<ArticleModel> getAllArticles() => <ArticleModel>[
        ArticleModel(
            author: "Williano",
            title:
                "Sports is the Best1 Sports is the Best1 Sports is the Best1",
            imageURL: "assets/images/error.jpg",
            category: "Sports",
            body: "Test",
            numberOfViews: 5000,
            readTime: 200,
            datePublishedOn: "April 15, 2019"),
        ArticleModel(
            author: "Williano Williano",
            title:
                "Software is the Best1 Sports is the Best1 Sports is the Best1 ",
            imageURL: "assets/images/se.jpg",
            category: "Software Engineering",
            body: "Test",
            numberOfViews: 5000,
            readTime: 200,
            datePublishedOn: "May 15, 2019"),
        ArticleModel(
            author: "William Kwabla",
            title: "Art is the Best1",
            imageURL: "assets/images/art.jpg",
            category: "Art",
            body: "Test",
            numberOfViews: 5000,
            readTime: 200,
            datePublishedOn: "Jan 15, 2019"),
        ArticleModel(
            author: "Bill",
            title: "Food is the Best1",
            imageURL: "assets/images/food.jpg",
            category: "Food",
            body: "Test",
            numberOfViews: 5000,
            readTime: 200,
            datePublishedOn: "Feb 15, 2020"),
        ArticleModel(
            author: "Seema",
            title: "Design is the Best1",
            imageURL: "assets/images/design.jpg",
            category: "Design",
            body: "Test",
            numberOfViews: 5000,
            readTime: 200,
            datePublishedOn: "April 15, 2019"),
        ArticleModel(
            author: "Khalil",
            title: "Education is the Best1",
            imageURL: "assets/images/education.jpg",
            category: "Education",
            body: "Test",
            numberOfViews: 5000,
            readTime: 200,
            datePublishedOn: "April 15, 2019"),
        ArticleModel(
            author: "Dr. Tansel Halic",
            title: "Entertainment is the Best1",
            imageURL: "assets/images/Entertainment.jpg",
            category: "Entertainment",
            body: "Test",
            numberOfViews: 5000,
            readTime: 200,
            datePublishedOn: "April 15, 2019"),
        ArticleModel(
            author: "Adiza Rasheed",
            title: "Programming is the Best1",
            imageURL: "assets/images/programming.jpg",
            category: "Programming",
            body: "Test",
            numberOfViews: 5000,
            readTime: 200,
            datePublishedOn: "April 15, 2019"),
        ArticleModel(
            author: "Kwabena Yeboah",
            title: "Sports is the Best1",
            imageURL: "assets/images/error.jpg",
            category: "Sports",
            body: "Test",
            numberOfViews: 5000,
            readTime: 200,
            datePublishedOn: "April 15, 2019"),
        ArticleModel(
            author: "Oliver Boamah",
            title: "Bugs is the Best1",
            imageURL: "assets/images/error4.jpg",
            category: "Bug",
            body: "Test",
            numberOfViews: 5000,
            readTime: 200,
            datePublishedOn: "April 15, 2019"),
      ];
}
