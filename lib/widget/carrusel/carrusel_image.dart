import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarruselImage extends StatefulWidget {
  const CarruselImage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarruselImageState();
  }
}

class _CarruselImageState extends State<CarruselImage> {
  final List<String> images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoXsJHSvQyODNWGPlVd6TstIV3Bkuo-m3-Ww&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoXsJHSvQyODNWGPlVd6TstIV3Bkuo-m3-Ww&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoXsJHSvQyODNWGPlVd6TstIV3Bkuo-m3-Ww&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoXsJHSvQyODNWGPlVd6TstIV3Bkuo-m3-Ww&usqp=CAU',
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var imageUrl in images) {
        FadeInImage.assetNetwork(placeholder: 'image/loading.gif', image: imageUrl);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider.builder(
        itemCount: images.length,
        options: CarouselOptions(
      autoPlay: true,
      aspectRatio: 2.0,
      enlargeCenterPage: true,
      autoPlayInterval: const Duration(seconds: 2)
        ),
        itemBuilder: (context, index, realIdx) {
      return Container(
        child: Center(
            child: Image.network(images[index],
                fit: BoxFit.cover, width: 1000)),
      );
        },
      ),
    );
  }
}