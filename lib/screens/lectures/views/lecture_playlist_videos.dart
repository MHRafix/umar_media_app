import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:umar_media/screens/lectures/components/lecture_playlist_videos/video-card.dart';
import 'package:umar_media/widgets/common-widgets/empty-state/empty-state.dart';
import 'package:umar_media/widgets/common-widgets/skeletons/card-common-skeleton.dart';

class LecturePlaylistVideosScreen extends StatelessWidget {
  final String id;
  final String name;
  LecturePlaylistVideosScreen(
      {super.key, required this.id, required this.name});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    // videos query
    String videosQuery =
        """query Get_Lectures_Videos(\$input: LecturesVideosQueryWithPagination!){
  lecturesVideos(input: \$input){
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
}""";

    return Scaffold(
        backgroundColor: Color(0x121544),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            //replace with our own icon data.
          ),
          title: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          titleSpacing: 00.0,
          toolbarHeight: 60.2,
          toolbarOpacity: .9,
          elevation: 0.00,
          backgroundColor: Color.fromRGBO(3, 25, 59, 1),
        ),
        body: SafeArea(
            child: Query(
                options: QueryOptions(
                    document: gql(
                      videosQuery,
                    ),
                    variables: {
                      "input": {
                        "where": {
                          "key": "playlist",
                          "operator": "eq",
                          "value": id
                        }
                      }
                    }),
                builder: (result,
                    {FetchMore? fetchMore, VoidCallback? refetch}) {
                  if (result.hasException) {
                    print("Query Result: ${result.hasException}");
                  }
                  final data = result.data?['lecturesVideos'];
                  return result.isLoading
                      ? ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: 12,
                          itemBuilder: (BuildContext context, int index) {
                            return const CardCommonSkeleton();
                          })
                      : RefreshIndicator(
                          triggerMode: RefreshIndicatorTriggerMode.onEdge,
                          edgeOffset: 0,
                          displacement: 30,
                          key: _refreshIndicatorKey,
                          color: Color.fromRGBO(119, 110, 249, 1),
                          backgroundColor: Color.fromARGB(255, 5, 9, 63),
                          strokeWidth: 3.0,
                          onRefresh: () async {
                            // refetch query after refresh
                            refetch!();
                            return Future<void>.delayed(
                                const Duration(seconds: 3));
                          },
                          // Pull from top to show refresh indicator.
                          child: data['nodes']?.length == 0 && !result.isLoading
                              ? const EmptyState(
                                  label: "I am empty :(",
                                  tagline: "You have no video")
                              : ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 0),
                                  itemCount: data['nodes'].length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return VideoCard(
                                        video: data['nodes'][index],
                                        playlistId: id);
                                  }),
                        );
                })));
  }
}
