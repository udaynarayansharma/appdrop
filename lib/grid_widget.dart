import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  const GridWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(data["padding"] ?? 0),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: data["columns"],
        crossAxisSpacing: (data["spacing"] ?? 8).toDouble(),
        mainAxisSpacing: (data["spacing"] ?? 8).toDouble(),
        children: (data["images"] as List).map((img) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(img, fit: BoxFit.cover),
          );
        }).toList(),
      ),
    );
  }
}
