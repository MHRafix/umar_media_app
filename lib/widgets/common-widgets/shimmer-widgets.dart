import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerWidget.rectangular({
    super.key,
    this.width = double.infinity,
    required this.height,
  }) : shapeBorder = const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)));

  const ShimmerWidget.videoCard({
    super.key,
    this.width = double.infinity,
    required this.height,
  }) : shapeBorder = const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)));

  // const ShimmerWidget.square({
  //   super.key,
  //   this.width = double.infinity,
  //   required this.height,
  // });

  const ShimmerWidget.circular(
      {super.key,
      required this.height,
      required this.width,
      this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
      baseColor: Color.fromRGBO(46, 46, 108, 1),
      highlightColor: Color.fromRGBO(32, 32, 70, 1),
      child: Container(
        width: width,
        height: height,
        decoration:
            ShapeDecoration(color: Colors.grey[400]!, shape: shapeBorder),
      ));
}
