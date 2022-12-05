import 'dart:convert';
import 'package:apptaller/models/photo.dart';

class PhotosResponse {
  
  PhotosResponse({
    required this.results
  });

  List<Photo> results;

  factory PhotosResponse.fromJson(String str) => PhotosResponse.toList(json.decode(str));

  factory PhotosResponse.toList(List<dynamic> photos) => PhotosResponse(
    results: List<Photo>.from(photos.map((x) => Photo.fromMap(x)))
  );

}