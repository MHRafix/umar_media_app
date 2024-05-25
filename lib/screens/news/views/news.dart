import 'package:flutter/material.dart';
import 'package:umar_media/screens/home/views/controll_screen.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
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
        body: SafeArea(
            child: RefreshIndicator(
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          edgeOffset: 20,
          displacement: 40,
          key: _refreshIndicatorKey,
          color: Color.fromRGBO(119, 110, 249, 1),
          backgroundColor: Color.fromARGB(255, 5, 9, 63),
          strokeWidth: 3.0,
          onRefresh: () async {
            print("refreshed...");
            // refetch!();
            return Future<void>.delayed(const Duration(seconds: 3));
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            20,
                            (index) => Container(
                                  width: 270,
                                  margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                                  decoration: BoxDecoration(
                                    // color: Color.fromRGBO(3, 25, 59, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        child: FadeInImage.assetNetwork(
                                          placeholder:
                                              'assets/images/placeholder_image.png',
                                          image:
                                              "https://images.unsplash.com/photo-1431440869543-efaf3388c585?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZGFya3xlbnwwfHwwfHx8MA%3D%3D",
                                          width: 270,
                                          height: 140,
                                          fit: BoxFit.cover,
                                          placeholderFit: BoxFit.contain,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(8, 0, 8, 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Top 10 thing remember while",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              "Lorem ispum dollar sit ammet and something or nothing but else and drawer hook...",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
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
                                                      horizontal: 20,
                                                      vertical: 4),
                                                  decoration: BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          127, 119, 255, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Text("20 Feb 2015",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w400)),
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
                            20,
                            (index) => Container(
                                  // width: 270,
                                  margin: EdgeInsets.fromLTRB(0, 0, 8, 8),
                                  decoration: BoxDecoration(
                                    // color: Color.fromRGBO(3, 25, 59, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: InkWell(
                                    onTap: () {},
                                    hoverColor: Color.fromRGBO(3, 25, 59, 1),
                                    highlightColor:
                                        Color.fromRGBO(3, 25, 59, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5)),
                                            child: FadeInImage.assetNetwork(
                                              placeholder:
                                                  'assets/images/placeholder_image.png',
                                              image:
                                                  "https://images.unsplash.com/photo-1431440869543-efaf3388c585?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZGFya3xlbnwwfHwwfHx8MA%3D%3D",
                                              width: 120,
                                              height: 80,
                                              fit: BoxFit.cover,
                                              placeholderFit: BoxFit.contain,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          // Container(
                                          // child:
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Top 10 thing remember ",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                              ),
                                              // SizedBox(
                                              //   height: 2,
                                              // ),
                                              Text(
                                                "Lorem ispum dollar...",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white),
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
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                            vertical: 4),
                                                    decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            127, 119, 255, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Text("20 Feb 2015",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                  ),
                                                ],
                                              )
                                            ],
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
                ])),
          ),
        )));
  }
}
