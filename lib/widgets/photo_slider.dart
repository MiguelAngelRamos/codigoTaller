import 'package:apptaller/models/photo.dart';
import 'package:flutter/material.dart';

class PhotoSlider extends StatefulWidget {

  const PhotoSlider({super.key, required this.photos, this.title});

  //* Propiedades de clase
  final List<Photo> photos;
  final String? title;


  @override
  State<PhotoSlider> createState() => _PhotoSliderState();
}

class _PhotoSliderState extends State<PhotoSlider> {

  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(
        children: [
          if(widget.title != null )
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(widget.title!, style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ))
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.photos.length,
              itemBuilder: (context, index) => _PhotoPoster(photo: widget.photos[index]),
            ),
          )
        ],
      ),
    );
  }
}

//* Poster del Personaje

class _PhotoPoster extends StatelessWidget {

  const _PhotoPoster({super.key, required this.photo });
  final Photo photo;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'detail', arguments: photo),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // * ClipRRect nos permite agregar bordes rendondeados
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage("${photo.url}.jpg"),
                width: 130,
                height: 190,
                fit: BoxFit.cover
              ),
            )
          ),
          const SizedBox(height: 5),
          Text(
            photo.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
    
            )
        ]
      )
    );
  }
}