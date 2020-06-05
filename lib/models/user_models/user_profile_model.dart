import 'package:flutter/foundation.dart';

class UserProfile {
  String username;
  String firstName;
  String lastName;
  String userGroup;
  String userProfileImageURL;
  String userProfileBannerImageURL;
  String jobTitle;
  String bio;
  String address;
  String city;
  String country;
  String zipCode;
  String twitterURL;
  String instagramURL;
  String facebookURL;
  String gitHubURL;
  String dateJoinedOn;
  String timeJoinedOn;

  UserProfile(
      {@required this.username,
      @required this.userGroup,
      @required this.userProfileImageURL,
      @required this.userProfileBannerImageURL,
      this.firstName,
      this.lastName,
      this.jobTitle,
      this.bio,
      this.address,
      this.city,
      this.country,
      this.zipCode,
      this.instagramURL,
      this.twitterURL,
      this.facebookURL,
      this.gitHubURL,
      this.dateJoinedOn,
      this.timeJoinedOn})
      : assert(username != null),
        assert(userGroup != null),
        assert(userProfileImageURL != null),
        assert(userProfileBannerImageURL != null);

  @override
  String toString() => "$username";
}
