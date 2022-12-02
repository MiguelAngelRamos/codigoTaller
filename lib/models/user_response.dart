import 'dart:convert';

import 'package:apptaller/models/photo.dart';
import 'package:apptaller/models/user.dart';

class UsersResponse {

  UsersResponse({
    required this.results
  });

  List<User> results;

  //* factory PhotosResponse.fromJson(String str) => PhotosResponse.fromMap(json.decode(str));

  factory UsersResponse.fromJson(String str) => UsersResponse.toList(json.decode(str));



 factory UsersResponse.toList(List<dynamic> photos) => UsersResponse(
    results: List<User>.from(photos.map((x) => Photo.fromMap(x)))
  );
}