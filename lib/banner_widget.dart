import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  const BannerWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(data["padding"] ?? 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(data["radius"]?.toDouble() ?? 0),
        child: Image.network(
          data["image"],
          height: (data["height"] ?? 150).toDouble(),
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
