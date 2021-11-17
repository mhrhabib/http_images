import 'package:flutter/material.dart';
import 'package:http_tuto/models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  const ImageList({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: Image.network(images[index].title),
        );
      },
    );
  }
}
