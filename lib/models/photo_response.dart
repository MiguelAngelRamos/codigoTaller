import 'dart:convert';

import 'package:apptaller/models/photo.dart';

class PhotosResponse {

  PhotosResponse({
    required this.results
  });

  List<dynamic> results;

  //* factory PhotosResponse.fromJson(String str) => PhotosResponse.fromMap(json.decode(str));

  factory PhotosResponse.fromJson(String str) => PhotosResponse.toList(json.decode(str));

  // factory PhotosResponse.toList(List<dynamic> photos) => PhotosResponse(
  //   results: List<Photo>.from(photos.map((x) => x)),
  // );

 factory PhotosResponse.toList(List<dynamic> photos) => PhotosResponse(
    results: photos
  );
  // factory PhotosResponse.fromMap(Map<String, dynamic> json) => PhotosResponse(
  //   results: List<Photo>.from(json[].map((x) => Photo.fromMap(x))));
}

// Exception has occurred.
// _TypeError (type 'List<dynamic>' is not a subtype of type 'List<Photo>')

// Exception has occurred.
// _TypeError (type '_InternalLinkedHashMap<String, dynamic>' is not a subtype of type 'Photo')