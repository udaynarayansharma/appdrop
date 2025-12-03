import 'package:flutter/material.dart';
import 'dart:convert';
import 'component_model.dart';
import 'widget_factory.dart';

class DynamicPage extends StatelessWidget {
  final String jsonData = """
{
  "page": {
    "components": [
      {
        "type": "banner",
        "image": "https://picsum.photos/800/300",
        "height": 180,
        "padding": 16,
        "radius": 12
      },
      {
        "type": "carousel",
        "images": [
          "https://picsum.photos/800/300?1",
          "https://picsum.photos/800/300?2"
        ],
        "height": 200,
        "autoPlay": true,
        "padding": 12
      },
      {
        "type": "grid",
        "images": [
          "https://picsum.photos/200?1",
          "https://picsum.photos/200?2",
          "https://picsum.photos/200?3"
        ],
        "columns": 3,
        "spacing": 8,
        "padding": 16
      },
      {
        "type": "music",
        "title": "Calm Piano Melody",
        "image": "https://picsum.photos/400/200?music",
        "url": "https://example.com/music.mp3",
        "padding": 16
      },
      {
        "type": "text",
        "value": "Welcome to AppDrop Engine!",
        "size": 22,
        "weight": "bold",
        "align": "center",
        "padding": 16
      }
    ]
  }
}
""";

  @override
  Widget build(BuildContext context) {
    final jsonMap = jsonDecode(jsonData);
    final components = jsonMap["page"]["components"] as List;

    final models = components.map((e) => ComponentModel.fromJson(e)).toList();

    return Scaffold(
      appBar: AppBar(title: Text("AppDrop")),
      body: SingleChildScrollView(
        child: Column(
          children: models.map((m) => WidgetFactory.build(m)).toList(),
        ),
      ),
    );
  }
}
