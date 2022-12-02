import 'package:apptaller/provider/photos_provider.dart';
import 'package:apptaller/widgets/swiper_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final getPhotoProvider = Provider.of<PhotosProvider>(context, listen: true);
    print(getPhotoProvider.photosResults);
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Photos'),
        elevation: 10
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwiperContainer(photos: getPhotoProvider.photosResults)
          ],
        ),
      )
    );
  }
}