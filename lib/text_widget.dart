import 'package:flutter/material.dart';

class TextWidgetBlock extends StatelessWidget {
  final Map<String, dynamic> data;

  const TextWidgetBlock({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(data["padding"] ?? 0),
      child: Text(
        data["value"],
        textAlign: _getAlign(),
        style: TextStyle(
          fontSize: (data["size"] ?? 16).toDouble(),
          fontWeight: _getWeight(),
        ),
      ),
    );
  }

  TextAlign _getAlign() {
    switch (data["align"]) {
      case "center":
        return TextAlign.center;
      case "right":
        return TextAlign.right;
      default:
        return TextAlign.left;
    }
  }

  FontWeight _getWeight() {
    switch (data["weight"]) {
      case "bold":
        return FontWeight.bold;
      case "medium":
        return FontWeight.w500;
      default:
        return FontWeight.normal;
    }
  }
}
