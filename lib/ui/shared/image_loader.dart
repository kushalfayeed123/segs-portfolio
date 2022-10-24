import 'dart:html';

import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class ImageLoader extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final double radius;
  const ImageLoader(
      {Key? key,
      required this.image,
      required this.height,
      required this.width,
      required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          )),
    );
    //     ImageNetwork(
    //   image: image,
    //   height: height,
    //   width: width,
    //   duration: 0,
    //   curve: Curves.linear,
    //   onPointer: true,
    //   debugPrint: false,
    //   fullScreen: false,
    //   fitAndroidIos: BoxFit.cover,
    //   fitWeb: BoxFitWeb.cover,
    //   onError: const Icon(
    //     Icons.error,
    //     color: Colors.red,
    //   ),
    //   onTap: () {},
    //   borderRadius: BorderRadius.circular(radius),
    // );
  }
}
