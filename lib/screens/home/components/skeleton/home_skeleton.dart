import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeFeedSkeleton extends StatelessWidget {
  const HomeFeedSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Shimmer.fromColors(
                baseColor: Color.fromRGBO(3, 25, 59, 1),
                highlightColor: Color.fromRGBO(6, 34, 75, 1),
                child: Container(
                  height: 160,
                  decoration: ShapeDecoration(
                      color: Colors.grey[400]!,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                )),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                      children: List.generate(
                          5,
                          (index) => Container(
                                width: 270,
                                // height: 100,
                                margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                                decoration: BoxDecoration(
                                  // color: Color.fromRGBO(3, 25, 59, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Shimmer.fromColors(
                                        baseColor: Color.fromRGBO(3, 25, 59, 1),
                                        highlightColor:
                                            Color.fromRGBO(6, 34, 75, 1),
                                        child: Container(
                                          width: 270,
                                          height: 140,
                                          decoration: ShapeDecoration(
                                              color: Colors.grey[400]!,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10)))),
                                        )),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Shimmer.fromColors(
                                        baseColor: Color.fromRGBO(3, 25, 59, 1),
                                        highlightColor:
                                            Color.fromRGBO(6, 34, 75, 1),
                                        child: Container(
                                          width: 260,
                                          height: 18,
                                          decoration: ShapeDecoration(
                                              color: Colors.grey[400]!,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)))),
                                        )),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Shimmer.fromColors(
                                        baseColor: Color.fromRGBO(3, 25, 59, 1),
                                        highlightColor:
                                            Color.fromRGBO(6, 34, 75, 1),
                                        child: Container(
                                          width: 230,
                                          height: 10,
                                          decoration: ShapeDecoration(
                                              color: Colors.grey[400]!,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(3)))),
                                        )),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Shimmer.fromColors(
                                        baseColor: Color.fromRGBO(3, 25, 59, 1),
                                        highlightColor:
                                            Color.fromRGBO(6, 34, 75, 1),
                                        child: Container(
                                          width: 200,
                                          height: 10,
                                          decoration: ShapeDecoration(
                                              color: Colors.grey[400]!,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(3)))),
                                        )),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Shimmer.fromColors(
                                        baseColor: Color.fromRGBO(3, 25, 59, 1),
                                        highlightColor:
                                            Color.fromRGBO(6, 34, 75, 1),
                                        child: Container(
                                          width: 140,
                                          height: 30,
                                          decoration: ShapeDecoration(
                                              color: Colors.grey[400]!,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)))),
                                        )),
                                  ],
                                ),
                              ))),
                )),
            SizedBox(
              height: 25,
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                      children: List.generate(
                          5,
                          (index) => Container(
                                width: 135, // height: 100,
                                margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                                decoration: BoxDecoration(
                                  // color: Color.fromRGBO(3, 25, 59, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Shimmer.fromColors(
                                        baseColor: Color.fromRGBO(3, 25, 59, 1),
                                        highlightColor:
                                            Color.fromRGBO(6, 34, 75, 1),
                                        child: Container(
                                          width: 135,
                                          height: 100,
                                          decoration: ShapeDecoration(
                                              color: Colors.grey[400]!,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10)))),
                                        )),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Shimmer.fromColors(
                                        baseColor: Color.fromRGBO(3, 25, 59, 1),
                                        highlightColor:
                                            Color.fromRGBO(6, 34, 75, 1),
                                        child: Container(
                                          width: 130,
                                          height: 10,
                                          decoration: ShapeDecoration(
                                              color: Colors.grey[400]!,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(3)))),
                                        )),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Shimmer.fromColors(
                                        baseColor: Color.fromRGBO(3, 25, 59, 1),
                                        highlightColor:
                                            Color.fromRGBO(6, 34, 75, 1),
                                        child: Container(
                                          width: 115,
                                          height: 10,
                                          decoration: ShapeDecoration(
                                              color: Colors.grey[400]!,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(3)))),
                                        )),
                                  ],
                                ),
                              ))),
                )),
            SizedBox(
              height: 25,
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                      children: List.generate(
                          5,
                          (index) => Container(
                                width: 135, // height: 100,
                                margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                                decoration: BoxDecoration(
                                  // color: Color.fromRGBO(3, 25, 59, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Shimmer.fromColors(
                                        baseColor: Color.fromRGBO(3, 25, 59, 1),
                                        highlightColor:
                                            Color.fromRGBO(6, 34, 75, 1),
                                        child: Container(
                                          width: 135,
                                          height: 100,
                                          decoration: ShapeDecoration(
                                              color: Colors.grey[400]!,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10)))),
                                        )),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Shimmer.fromColors(
                                        baseColor: Color.fromRGBO(3, 25, 59, 1),
                                        highlightColor:
                                            Color.fromRGBO(6, 34, 75, 1),
                                        child: Container(
                                          width: 130,
                                          height: 10,
                                          decoration: ShapeDecoration(
                                              color: Colors.grey[400]!,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(3)))),
                                        )),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Shimmer.fromColors(
                                        baseColor: Color.fromRGBO(3, 25, 59, 1),
                                        highlightColor:
                                            Color.fromRGBO(6, 34, 75, 1),
                                        child: Container(
                                          width: 115,
                                          height: 10,
                                          decoration: ShapeDecoration(
                                              color: Colors.grey[400]!,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(3)))),
                                        )),
                                  ],
                                ),
                              ))),
                )),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
