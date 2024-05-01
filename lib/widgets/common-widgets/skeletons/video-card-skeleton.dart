import 'package:flutter/material.dart';
import 'package:ttp_app/widgets/common-widgets/shimmer-widgets.dart';

class VideoCardSkeleton extends StatelessWidget {
  const VideoCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(20),
          color: Colors.white70,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(
                1.0,
                1.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            )
          ]),
      // height: MediaQuery.of(context).size.height,
      alignment: Alignment.centerLeft,

      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ShimmerWidget.videoCard(height: 280),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: ShimmerWidget.rectangular(
              height: 60,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: ShimmerWidget.rectangular(
              height: 370,
            ),
          ),
        ],
      ),
    );
  }
}
