import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageLoader extends ConsumerWidget {
  final String image;
  final double height;
  final double width;
  final double radius;
  final Color color;
  const ImageLoader(
      {Key? key,
      required this.image,
      required this.height,
      required this.width,
      required this.radius,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            image: AssetImage(image),
            colorFilter: ColorFilter.mode(color, BlendMode.dstATop),
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
