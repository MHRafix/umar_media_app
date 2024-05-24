import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:umar_media/widgets/common-widgets/skeletons/card-common-skeleton.dart';
// import 'package:ttp_app/widgets/common-widgets/shimmer-widgets.dart';

class VideoCardSkeleton extends StatelessWidget {
  const VideoCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(20),
          color: Color(0x121544),
          boxShadow: [
            BoxShadow(
              color: Color(0x121544),
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

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Shimmer.fromColors(
              baseColor: Color.fromRGBO(3, 25, 59, 1),
              highlightColor: Color.fromRGBO(6, 34, 75, 1),
              child: Container(
                height: 280,
                decoration: ShapeDecoration(
                    color: Colors.grey[400]!,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)))),
              )),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Shimmer.fromColors(
                baseColor: Color.fromRGBO(3, 25, 59, 1),
                highlightColor: Color.fromRGBO(6, 34, 75, 1),
                child: Container(
                  height: 60,
                  decoration: ShapeDecoration(
                      color: Colors.grey[400]!,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)))),
                )),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Expanded(
                  child: Column(
                children: [
                  CardCommonSkeleton(),
                  CardCommonSkeleton(),
                  CardCommonSkeleton(),
                  CardCommonSkeleton(),
                ],
              ))),
        ],
      ),
    );
  }
}
