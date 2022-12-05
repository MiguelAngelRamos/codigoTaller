import 'package:apptaller/models/models.dart';
import 'package:apptaller/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UsersProvider extends ChangeNotifier {
  
  final String _baseUrl = 'jsonplaceholder.typicode.com';

  //* Listas
  List<User> usersResult = [];

  UsersProvider() {
    getUsers();
  }

Future<String> _getJsonData(String segmentUrl) async {
    //* Construyendo la url de la petición
    final url = Uri.https(_baseUrl, segmentUrl);

    final response = await http.get(url);

    if(response.statusCode != 200) {
      return 'Error en la peticion';
    }
    return response.body;
  }

  //* https://jsonplaceholder.typicode.com/users

    getUsers() async {
    final jsonData = await _getJsonData('/users');
    print(jsonData);
    print(jsonData is String); //* True

    final usersResponse = UsersResponse.fromJson(jsonData);
    
    usersResult = usersResponse.results;

    //* les avisa a los widgets que estan escuchando que sucede con la data en caso de cambios y los widgets que estan escuchando se vuelven a renderizar o redibujar
    notifyListeners();
    
  }
}