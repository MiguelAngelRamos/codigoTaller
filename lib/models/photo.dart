// To parse this JSON data, do
//
//     final photos = photosFromMap(jsonString);

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

    
}
