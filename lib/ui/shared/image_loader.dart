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
    return ImageNetwork(
      image: image,
      height: height,
      width: width,
      duration: 1500,
      curve: Curves.easeIn,
      onPointer: true,
      debugPrint: false,
      fullScreen: false,
      fitAndroidIos: BoxFit.cover,
      fitWeb: BoxFitWeb.cover,
      onLoading: const CircularProgressIndicator(
        color: Colors.indigoAccent,
      ),
      onError: const Icon(
        Icons.error,
        color: Colors.red,
      ),
      onTap: () {},
      borderRadius: BorderRadius.circular(radius),
    );
  }
}
