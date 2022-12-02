import 'dart:convert';

import 'package:apptaller/models/models.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class SwiperContainer extends StatelessWidget {

  const SwiperContainer({super.key, required this.photos});
  final List<dynamic> photos;

  @override
  Widget build(BuildContext context) {
    //* Obteniendo las dimensiones del dispositivo
    final size = MediaQuery.of(context).size;

    if(photos.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(child: CircularProgressIndicator())
      );
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: photos.length - 4900,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.77,
        itemHeight: size.height * 0.42,
        itemBuilder: (context, index) {
          final photo = photos[index];
          return GestureDetector(
           child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(photo['url']+".jpg"),
              fit: BoxFit.fill
            )
           ),
          );
        },
        
      )
    );
  }
}