import 'package:apptaller/models/photo.dart';
import 'package:apptaller/models/photo_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhotosProvider extends ChangeNotifier {
  final String _baseUrl = 'jsonplaceholder.typicode.com';

  //* Listas

  List<Photo> photosResults = [];

  PhotosProvider() {
    getPhotos();
  }

  Future<String> _getJsonData(String segmentUrl) async {
    //* Construyendo la url de la petición
    final url = Uri.https(_baseUrl, segmentUrl);

    final response = await http.get(url);

    if(response.statusCode != 200) {
      return 'Error en la petición';
    }
    return response.body;
  }

  // * https://jsonplaceholder.typicode.com/photos
  getPhotos() async {
    
    final jsonData = await _getJsonData('/photos');
    final photosResponse = PhotosResponse.fromJson(jsonData);
    print(photosResponse.results);
    photosResults = photosResponse.results;
    notifyListeners();

  }
}