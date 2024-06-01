import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:umar_media/screens/home/components/skeleton/home_skeleton.dart';
import 'package:umar_media/screens/home/views/controll_screen.dart';
import 'package:umar_media/screens/lectures/views/lecture_playlist_videos.dart';
import 'package:umar_media/screens/lectures/views/play_video.dart';
import 'package:umar_media/screens/news/views/news.dart';

class Slide {
  Slide({
    required this.title,
    required this.height,
    required this.color,
    required this.poster,
  });

  final Color color;
  final double height;
  final String title;
  final String poster;
}

List<String> posters = [
  "https://nypost.com/wp-content/uploads/sites/2/2021/10/afghanistan-taliban-kabul-4.jpg?quality=75&strip=all",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTba-YnREWS37nnJcLzdhitSX-oLPYkAW2I2Zzwutgy4w&s",
  "https://www.atlanticcouncil.org/wp-content/uploads/2017/08/20170818_IdlibalQaeda.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSK8mK9tUJL8yoObZITvwLXNvryNvFyOyCHqNLCKo-8SA&s",
  "https://www.middleeasteye.net/sites/default/files/main-images/000_Nic6406079.jpg"
];

var slides = List.generate(
  5,
  (index) => Slide(
    title: 'Slide ${index + 1}',
    poster: posters[index],
    height: 200,
    color: Color.fromRGBO(3, 25, 59, 1),
  ),
);

final List<Widget> sliders = slides
    .map(
      (
        item,
      ) =>
          Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          child: Container(
              color: item.color,
              width: double.infinity,
              height: 160,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/placeholder_image.png',
                image: item.poster,
                height: 160,
                fit: BoxFit.cover,
                placeholderFit: BoxFit.contain,
              )),
        ),
      ),
    )
    .toList();

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;

    String _homeFeedDataQuery =
        """query Home_Feed_Data(\$newsPayload:NewsListQueryDto, \$nasheedPayload: LecturesVideosQueryWithPagination!){
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

    lecturesVideos(input: \$nasheedPayload){
    nodes{
    _id
    title
    lecturer
    video
    thumbnail
    likeCount
    viewsCount
    createdAt
    }}
    }
    """;

    return Scaffold(
        backgroundColor: Color(0x121544),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: AppBar(
            backgroundColor: Color.fromRGBO(3, 25, 59, 1),
            automaticallyImplyLeading: false, // Example of using Icon widget
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Umar Media",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromRGBO(127, 119, 255, 1),
                      letterSpacing: 2),
                ),
                IconButton.filled(
                    style: IconButton.styleFrom(
                      backgroundColor: Color.fromRGBO(127, 119, 255, 1),
                    ),
                    onPressed: () => {},
                    icon: Icon(
                      Icons.outbound_outlined,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ),
        body: Query(
            options:
                QueryOptions(document: gql(_homeFeedDataQuery), variables: {
              "newsPayload": {
                "page": 1,
                "limit": 10,
                "sort": "DESC",
                "sortBy": "_id"
              },
              "nasheedPayload": {
                "where": {
                  "key": "playlist",
                  "operator": "eq",
                  "value": "662f2b11343f6be74ce52a7c"
                }
              }
            }),
            builder: (result, {FetchMore? fetchMore, VoidCallback? refetch}) {
              if (result.hasException) {
                print("Query Result: ${result.hasException}");
              }

              // news data
              final allNewsPaginationData = result.data?['allNews'];
              final allNewsData = allNewsPaginationData?['nodes'];

              // nasheed data
              final allNasheedPaginationData = result.data?['lecturesVideos'];
              final allNasheedData = allNasheedPaginationData?['nodes'];

              return SafeArea(
                child: result.isLoading
                    ? HomeFeedSkeleton()
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
                          padding: const EdgeInsets.all(5),
                          child: SingleChildScrollView(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              FlutterCarousel(
                                options: CarouselOptions(
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 5),
                                  disableCenter: true,
                                  viewportFraction:
                                      deviceSize.width > 800.0 ? 0.8 : 1.0,
                                  height: 160,
                                  indicatorMargin: 12.0,
                                  enableInfiniteScroll: true,
                                  slideIndicator:
                                      const CircularSlideIndicator(),
                                ),
                                items: sliders,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                  child:
                                      allNewsData?.length != 0 &&
                                              !result.isLoading
                                          ? Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Breaking News",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .push(
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                NewsScreen(),
                                                          ),
                                                        );
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        maximumSize:
                                                            const Size(85, 40),
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 8,
                                                                vertical: 0),
                                                        // backgroundColor: Color.fromRGBO(127, 119, 255, 1)[100],

                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'See all',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        127,
                                                                        119,
                                                                        255,
                                                                        1)),
                                                          ),
                                                          Icon(
                                                            Icons.arrow_forward,
                                                            size: 20,
                                                            color:
                                                                Color.fromRGBO(
                                                                    127,
                                                                    119,
                                                                    255,
                                                                    1),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  clipBehavior: Clip.hardEdge,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    child: Row(
                                                      children: List.generate(
                                                          allNewsData?.length,
                                                          (index) => Container(
                                                                width: 270,
                                                                margin: EdgeInsets
                                                                    .fromLTRB(
                                                                        0,
                                                                        0,
                                                                        8,
                                                                        0),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  // color: Color.fromRGBO(3, 25, 59, 1),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              10)),
                                                                ),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius: const BorderRadius
                                                                          .all(
                                                                          Radius.circular(
                                                                              10)),
                                                                      child: FadeInImage
                                                                          .assetNetwork(
                                                                        placeholder:
                                                                            'assets/images/placeholder_image.png',
                                                                        image: allNewsData[index]
                                                                            [
                                                                            'thumbnail'],
                                                                        width:
                                                                            270,
                                                                        height:
                                                                            140,
                                                                        fit: BoxFit
                                                                            .cover,
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
                                                                              8,
                                                                              0,
                                                                              8,
                                                                              8),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          Text(
                                                                            allNewsData[index]['title'],
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            maxLines:
                                                                                1, // Limit the number of lines before ellipsis

                                                                            style: TextStyle(
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: Colors.white),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                2,
                                                                          ),
                                                                          Text(
                                                                            allNewsData[index]['shortDescription'],
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            maxLines:
                                                                                2, // Limit the number of lines before ellipsis

                                                                            style: TextStyle(
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w400,
                                                                                color: Colors.white),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Container(
                                                                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                                                                                decoration: BoxDecoration(color: Color.fromRGBO(127, 119, 255, 1), borderRadius: BorderRadius.circular(5)),
                                                                                child: Text(DateFormat('d MMM yyyy').format(DateTime.parse(allNewsData?[index]?['createdAt'])), style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),
                                                                              ),
                                                                            ],
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : null),
                              SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Attack & Videos",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ControlScreen(),
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            maximumSize: const Size(85, 40),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 0),
                                            // backgroundColor: Color.fromRGBO(127, 119, 255, 1)[100],

                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'See all',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        127, 119, 255, 1)),
                                              ),
                                              Icon(
                                                Icons.arrow_forward,
                                                size: 20,
                                                color: Color.fromRGBO(
                                                    127, 119, 255, 1),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      clipBehavior: Clip.hardEdge,
                                      child: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Row(
                                          children: List.generate(
                                              20,
                                              (index) => Container(
                                                    width: 135,
                                                    margin: EdgeInsets.fromLTRB(
                                                        0, 0, 8, 0),
                                                    decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          56, 57, 62, .6),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          10)),
                                                          child: Stack(
                                                            children: [
                                                              FadeInImage
                                                                  .assetNetwork(
                                                                placeholder:
                                                                    'assets/images/placeholder_image.png',
                                                                image:
                                                                    "https://media.istockphoto.com/id/1368236367/photo/snipers-training-on-a-shooting-range-m4-ar-15-rifle-details-looking-over-the-shoulder-blue.webp?b=1&s=170667a&w=0&k=20&c=Kf2vSIuMl_eI5OiUWvABAhcmoDLhokN_DDyr0z5fMoM=",
                                                                width: 135,
                                                                height: 100,
                                                                fit: BoxFit
                                                                    .cover,
                                                                placeholderFit:
                                                                    BoxFit
                                                                        .contain,
                                                              ),
                                                              Positioned(
                                                                top:
                                                                    30, // Adjust top position as needed
                                                                left:
                                                                    45, // Adjust left position as needed

                                                                child:
                                                                    IconButton
                                                                        .filled(
                                                                  onPressed:
                                                                      () {},
                                                                  style: IconButton
                                                                      .styleFrom(
                                                                    backgroundColor:
                                                                        Color.fromRGBO(
                                                                            127,
                                                                            119,
                                                                            255,
                                                                            1),
                                                                  ),
                                                                  icon: Icon(
                                                                    Icons
                                                                        .play_circle_fill,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              )
                                                            ],
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
                                                              Text(
                                                                "TTP attack in PK army slot",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                child:
                                    allNewsData?.length != 0 &&
                                            !result.isLoading
                                        ? Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Nasheed",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              LecturePlaylistVideosScreen(
                                                            id: "662f2b11343f6be74ce52a7c",
                                                            name: "Nasheed",
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      maximumSize:
                                                          const Size(85, 40),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8,
                                                          vertical: 0),
                                                      // backgroundColor: Color.fromRGBO(127, 119, 255, 1)[100],

                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'See all',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      127,
                                                                      119,
                                                                      255,
                                                                      1)),
                                                        ),
                                                        Icon(
                                                          Icons.arrow_forward,
                                                          size: 20,
                                                          color: Color.fromRGBO(
                                                              127, 119, 255, 1),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                clipBehavior: Clip.hardEdge,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: Row(
                                                    children: List.generate(
                                                        allNasheedData?.length,
                                                        (index) => Container(
                                                              width: 135,
                                                              height: 170,
                                                              margin: EdgeInsets
                                                                  .fromLTRB(0,
                                                                      0, 8, 0),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        56,
                                                                        57,
                                                                        62,
                                                                        .6),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                              ),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .push(
                                                                    MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              PlayVideoScreen(
                                                                        id: allNasheedData[index]
                                                                            ?[
                                                                            "_id"],
                                                                        playlistId:
                                                                            "662f2b11343f6be74ce52a7c",
                                                                        videoSrc: allNasheedData[index]
                                                                            ?[
                                                                            'video'],
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                hoverColor: Color
                                                                    .fromRGBO(
                                                                        3,
                                                                        25,
                                                                        59,
                                                                        1),
                                                                highlightColor:
                                                                    Color
                                                                        .fromRGBO(
                                                                            3,
                                                                            25,
                                                                            59,
                                                                            1),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius: const BorderRadius
                                                                          .only(
                                                                          topLeft: Radius.circular(
                                                                              10),
                                                                          topRight:
                                                                              Radius.circular(10)),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          FadeInImage
                                                                              .assetNetwork(
                                                                            placeholder:
                                                                                'assets/images/placeholder_image.png',
                                                                            image:
                                                                                allNasheedData[index]?['thumbnail'],
                                                                            width:
                                                                                135,
                                                                            height:
                                                                                100,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            placeholderFit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                          Positioned(
                                                                            top:
                                                                                30, // Adjust top position as needed
                                                                            left:
                                                                                45, // Adjust left position as needed

                                                                            child:
                                                                                IconButton.filled(
                                                                              onPressed: () {},
                                                                              style: IconButton.styleFrom(
                                                                                backgroundColor: Color.fromRGBO(127, 119, 255, 1),
                                                                              ),
                                                                              icon: Icon(
                                                                                Icons.play_circle_fill,
                                                                                color: Colors.white,
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 5,
                                                                    ),
                                                                    Container(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              8,
                                                                              0,
                                                                              8,
                                                                              8),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            allNasheedData[index]?['title'],
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            maxLines:
                                                                                3,
                                                                            style: TextStyle(
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: Colors.white),
                                                                          ),
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
                                            ],
                                          )
                                        : null,
                              ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          )),
                        ),
                      ),
              );
            }));
  }
}
