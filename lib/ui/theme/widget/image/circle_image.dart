import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double width;
  final double height;
  final String imageUrl;

  const CircleImage({Key key, this.width, this.height, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.fill, image: new NetworkImage(imageUrl))));
  }
}
