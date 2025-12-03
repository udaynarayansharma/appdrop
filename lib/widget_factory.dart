import 'package:flutter/material.dart';
import 'component_model.dart';
import 'banner_widget.dart';
import 'carousel_widget.dart';
import 'grid_widget.dart';
import 'text_widget.dart';
import 'music_widget.dart';

class WidgetFactory {
  static Widget build(ComponentModel model) {
    switch (model.type) {
      case "banner":
        return BannerWidget(data: model.data);

      case "carousel":
        return CarouselWidget(data: model.data);

      case "grid":
        return GridWidget(data: model.data);

      case "text":
        return TextWidgetBlock(data: model.data);

      case "music":
        return MusicWidgetBlock(data: model.data);

      default:
        return SizedBox();
    }
  }
}
