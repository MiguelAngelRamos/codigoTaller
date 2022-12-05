import 'package:apptaller/provider/photos_provider.dart';
import 'package:apptaller/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final getPhotoProvider = Provider.of<PhotosProvider>(context, listen: true);
    print(getPhotoProvider.photosResults);
    return Scaffold(
      drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
  // through the options in the drawer if there isn't enough vertical
  // space to fit everything.
    child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.deepPurple,
        ),
        child: Text('Menu de Usuarios', style: TextStyle(color: Colors.white, fontSize: 23)),
      ),
      ListTile(
        title: const Text('Ir a listado de usuarios', style: TextStyle(fontSize: 17)),
        onTap: () {
          Navigator.pushNamed(context, 'users');
        },
      ),
      // ListTile(
      //   title: const Text('Item 2'),
      //   onTap: () {
      //     // Update the state of the app.
      //     // ...
      //   },
      // ),
    ],
  ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('App Photos'),
        elevation: 10
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwiperContainer(photos: getPhotoProvider.photosResults),
            PhotoSlider(photos: getPhotoProvider.photosResults, title: 'Photos totales')
          ],
        ),
      )
    );
  }
}