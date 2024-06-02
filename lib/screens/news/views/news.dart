import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:umar_media/screens/home/components/skeleton/home_skeleton.dart';
import 'package:umar_media/screens/home/views/controll_screen.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    String _latestNewsQuery =
        """query Latest_News(\$newsPayload:NewsListQueryDto){
    allNews(input: \$newsPayload){
    nodes{
    _id
    title
    description
    shortDescription
    video
    thumbnail
    likeCount
    createdAt
    }
    }
    }
    """;

    return Scaffold(
      backgroundColor: Color(0x121544),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ControlScreen(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          //replace with our own icon data.
        ),
        // automaticallyImplyLeading: true,
        title: const Text(
          "All News",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),

        titleSpacing: 00.0,
        toolbarHeight: 60.2,
        toolbarOpacity: 1,
        elevation: 0.00,
        backgroundColor: Color.fromRGBO(3, 25, 59, 1),
      ),
      body: Query(
          options: QueryOptions(document: gql(_latestNewsQuery), variables: {
            "newsPayload": {
              "page": 1,
              "limit": 100,
              "sort": "DESC",
              "sortBy": "_id"
            },
          }),
          builder: (result, {FetchMore? fetchMore, VoidCallback? refetch}) {
            if (result.hasException) {
              print("Query Result: ${result.hasException}");
            }

            // news data
            final allNewsPaginationData = result.data?['allNews'];
            final latestNewsData =
                allNewsPaginationData?['nodes']?.take(5)?.toList();

            final recentNewsData = allNewsPaginationData?['nodes']?.sublist(1);

            return SafeArea(
                child: result.isLoading
                    ? SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              HorizontalGridNewsSkeleton(),
                              SizedBox(
                                height: 30,
                              ),
                              VerticalGridNewsSkeleton()
                            ],
                          ),
                        ),
                      )
                    : RefreshIndicator(
                        triggerMode: RefreshIndicatorTriggerMode.onEdge,
                        edgeOffset: 0,
                        displacement: 40,
                        key: _refreshIndicatorKey,
                        color: Color.fromRGBO(119, 110, 249, 1),
                        backgroundColor: Color.fromARGB(255, 5, 9, 63),
                        strokeWidth: 3.0,
                        onRefresh: () async {
                          // print("refreshed...");
                          refetch!();
                          return Future<void>.delayed(
                              const Duration(seconds: 3));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Latest News",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        size: 25,
                                        color: Color.fromRGBO(127, 119, 255, 1),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    clipBehavior: Clip.hardEdge,
                                    child: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Row(
                                        children: List.generate(
                                            latestNewsData?.length,
                                            (index) => Container(
                                                  width: 270,
                                                  margin: EdgeInsets.fromLTRB(
                                                      7, 0, 7, 0),
                                                  decoration: BoxDecoration(
                                                    // color: Color.fromRGBO(3, 25, 59, 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {},
                                                    hoverColor: Color.fromRGBO(
                                                        3, 25, 59, 1),
                                                    highlightColor:
                                                        Color.fromRGBO(
                                                            3, 25, 59, 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          10)),
                                                          child: FadeInImage
                                                              .assetNetwork(
                                                            placeholder:
                                                                'assets/images/placeholder_image.png',
                                                            image:
                                                                latestNewsData?[
                                                                        index]?[
                                                                    'thumbnail'],
                                                            width: 270,
                                                            height: 140,
                                                            fit: BoxFit.cover,
                                                            placeholderFit:
                                                                BoxFit.contain,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  8, 0, 8, 8),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                latestNewsData?[
                                                                        index]
                                                                    ?['title'],
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines:
                                                                    1, // Limit the number of lines before ellipsis
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              SizedBox(
                                                                height: 2,
                                                              ),
                                                              Text(
                                                                latestNewsData?[
                                                                        index]?[
                                                                    'shortDescription'],
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines:
                                                                    2, // Limit the number of lines before ellipsis
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            20,
                                                                        vertical:
                                                                            4),
                                                                    decoration: BoxDecoration(
                                                                        color: Color.fromRGBO(
                                                                            127,
                                                                            119,
                                                                            255,
                                                                            1),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5)),
                                                                    child: Text(
                                                                        DateFormat('d MMM yyyy').format(DateTime.parse(latestNewsData?[index]
                                                                            ?[
                                                                            'createdAt'])),
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.w400)),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Recent News",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    clipBehavior: Clip.hardEdge,
                                    child: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Column(
                                        children: List.generate(
                                            recentNewsData?.length,
                                            (index) => Container(
                                                  // width: MediaQuery.of(context)
                                                  //     .size
                                                  //     .width,
                                                  margin: EdgeInsets.fromLTRB(
                                                      0, 0, 0, 6),
                                                  decoration: BoxDecoration(
                                                    // color: Color.fromRGBO(3, 25, 59, 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {},
                                                    hoverColor: Color.fromRGBO(
                                                        3, 25, 59, 1),
                                                    highlightColor:
                                                        Color.fromRGBO(
                                                            3, 25, 59, 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 5.0,
                                                          vertical: 8),
                                                      child: Flex(
                                                        direction: Axis
                                                            .horizontal, // or Axis.vertical for vertical flex

                                                        children: [
                                                          Flexible(
                                                            flex: 1,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                      Radius.circular(
                                                                          5)),
                                                              child: FadeInImage
                                                                  .assetNetwork(
                                                                placeholder:
                                                                    'assets/images/placeholder_image.png',
                                                                image: recentNewsData?[
                                                                        index]?[
                                                                    'thumbnail'],
                                                                width: 120,
                                                                height: 80,
                                                                fit: BoxFit
                                                                    .cover,
                                                                placeholderFit:
                                                                    BoxFit
                                                                        .contain,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 8,
                                                          ),
                                                          // Container(
                                                          // child:
                                                          Flexible(
                                                            flex: 1,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  recentNewsData?[
                                                                          index]
                                                                      ?[
                                                                      'title'],
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 1,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                // SizedBox(
                                                                //   height: 2,
                                                                // ),
                                                                Text(
                                                                  recentNewsData?[
                                                                          index]
                                                                      ?[
                                                                      'shortDescription'],
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 2,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              20,
                                                                          vertical:
                                                                              4),
                                                                      decoration: BoxDecoration(
                                                                          color: Color.fromRGBO(
                                                                              127,
                                                                              119,
                                                                              255,
                                                                              1),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5)),
                                                                      child: Text(
                                                                          DateFormat('d MMM yyyy').format(DateTime.parse(recentNewsData[index]
                                                                              [
                                                                              'createdAt'])),
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.w400)),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                      ),
                                    ),
                                  ),
                                ]),
                            // }),
                          ),
                        ),
                      ));
          }),
    );
  }
}

class VerticalGridNewsSkeleton extends StatelessWidget {
  const VerticalGridNewsSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
              children: List.generate(
                  10,
                  (index) => Container(
                        // width: 270,
                        // height: 100,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                        decoration: BoxDecoration(
                          // color: Color.fromRGBO(3, 25, 59, 1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                                baseColor: Color.fromRGBO(3, 25, 59, 1),
                                highlightColor: Color.fromRGBO(6, 34, 75, 1),
                                child: Container(
                                  width: 120,
                                  height: 80,
                                  decoration: ShapeDecoration(
                                      color: Colors.grey[400]!,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)))),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Shimmer.fromColors(
                                    baseColor: Color.fromRGBO(3, 25, 59, 1),
                                    highlightColor:
                                        Color.fromRGBO(6, 34, 75, 1),
                                    child: Container(
                                      width: 210,
                                      height: 18,
                                      decoration: ShapeDecoration(
                                          color: Colors.grey[400]!,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)))),
                                    )),
                                // SizedBox(
                                //   height: 6,
                                // ),
                                // Shimmer.fromColors(
                                //     baseColor: Color.fromRGBO(3, 25, 59, 1),
                                //     highlightColor:
                                //         Color.fromRGBO(6, 34, 75, 1),
                                //     child: Container(
                                //       width: 190,
                                //       height: 10,
                                //       decoration: ShapeDecoration(
                                //           color: Colors.grey[400]!,
                                //           shape: RoundedRectangleBorder(
                                //               borderRadius: BorderRadius.all(
                                //                   Radius.circular(3)))),
                                //     )),
                                SizedBox(
                                  height: 6,
                                ),
                                Shimmer.fromColors(
                                    baseColor: Color.fromRGBO(3, 25, 59, 1),
                                    highlightColor:
                                        Color.fromRGBO(6, 34, 75, 1),
                                    child: Container(
                                      width: 180,
                                      height: 10,
                                      decoration: ShapeDecoration(
                                          color: Colors.grey[400]!,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
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
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)))),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ))),
        ));
  }
}
