import 'package:apptaller/models/user.dart';
import 'package:flutter/material.dart';

//* Esta clase recibe por argumento al usuario
class DetailsUser extends StatelessWidget {

  const DetailsUser({super.key});
  
  @override
  Widget build(BuildContext context) {
    // double sizeText = 20;
    TextStyle sizeText = const TextStyle(fontSize: 21);
    TextStyle sizeTextBold = const TextStyle(fontSize: 21, fontWeight: FontWeight.bold);
    //* Recuperamos al usuario por argumento
    final User user = ModalRoute.of(context)?.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Info User'),
        actions: [
          // Icon(Icons.home, size: 40,)
          IconButton(onPressed: () {
            Navigator.pushNamed(context, 'home');
          }, icon: const Icon(Icons.home, size: 30))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
          Row(
            children: [ Text('Name: ', style: sizeTextBold ), Text(user.name, style: sizeText)],
          ),
          const SizedBox(height: 10),
          Row(
            children: [ Text('Email: ', style: sizeTextBold), Text(user.email, style: sizeText)],
          ),
          const SizedBox(height: 10),
          Row(
            children: [ Text('Phone: ', style: sizeTextBold), Text(user.phone, style: sizeText)],
          ),
          const SizedBox(height: 10),
          Row(
            children: [ Text('WebSite: ', style: sizeTextBold), Text(user.website, style: sizeText)],
          ),
        ]),
      ),
    );
  }
}