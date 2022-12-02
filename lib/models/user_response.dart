import 'dart:convert';

import 'package:apptaller/models/user.dart';

class UsersResponse {

  UsersResponse({
    required this.results
  });

  List<User> results;

  //* factory PhotosResponse.fromJson(String str) => PhotosResponse.fromMap(json.decode(str));

  factory UsersResponse.fromJson(String str) => UsersResponse.toList(json.decode(str));



 factory UsersResponse.toList(List<dynamic> user) => UsersResponse(
    results: List<User>.from(user.map((x) => User.fromMap(x)))
  );
}