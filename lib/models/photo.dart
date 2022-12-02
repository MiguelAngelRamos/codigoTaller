// To parse this JSON data, do
//
//     final photos = photosFromMap(jsonString);

import 'dart:convert';

class Photo {
    Photo({
        required this.albumId,
        required this.id,
        required this.title,
        required this.url,
        required this.thumbnailUrl,
    });

    int albumId;
    int id;
    String title;
    String url;
    String thumbnailUrl;

    factory Photo.fromJson(String str) => Photo.fromMap(json.decode(str));

    // String toJson() => json.encode(toMap());

    factory Photo.fromMap(Map<String, dynamic> json) => Photo(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    // Map<String, dynamic> toMap() => {
    //     "albumId": albumId,
    //     "id": id,
    //     "title": title,
    //     "url": url,
    //     "thumbnailUrl": thumbnailUrl,
    // };
}
