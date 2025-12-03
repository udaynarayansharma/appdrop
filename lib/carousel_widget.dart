import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  const CarouselWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(data["padding"] ?? 0),
      child: CarouselSlider(
        items: (data["images"] as List).map((img) {
          return Image.network(img, fit: BoxFit.cover, width: double.infinity);
        }).toList(),
        options: CarouselOptions(
          height: (data["height"] ?? 200).toDouble(),
          autoPlay: data["autoPlay"] ?? false,
          viewportFraction: 1,
        ),
      ),
    );
  }
}
