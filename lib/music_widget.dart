import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicWidgetBlock extends StatefulWidget {
  final Map<String, dynamic> data;

  const MusicWidgetBlock({super.key, required this.data});

  @override
  State<MusicWidgetBlock> createState() => _MusicWidgetBlockState();
}

class _MusicWidgetBlockState extends State<MusicWidgetBlock> {
  final AudioPlayer player = AudioPlayer();
  bool playing = false;

  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    return Padding(
      padding: EdgeInsets.all(data["padding"]),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black12,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                data["image"],
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 12),
            Text(data["title"],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            IconButton(
              icon: Icon(
                playing ? Icons.pause_circle : Icons.play_circle_fill,
                size: 60,
                color: Colors.blue,
              ),
              onPressed: () async {
                if (playing) {
                  await player.pause();
                } else {
                  await player.play(UrlSource(data["url"]));
                }
                setState(() {
                  playing = !playing;
                });
              },
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
