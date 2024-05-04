import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:ttp_app/screens/home/utils/dataModel.dart';
import 'package:ttp_app/screens/lectures/components/lecture_playlist_videos/video-card.dart';
import 'package:ttp_app/widgets/common-widgets/empty-state/empty-state.dart';
import 'package:ttp_app/widgets/common-widgets/skeletons/card-common-skeleton.dart';
import 'package:ttp_app/widgets/common-widgets/skeletons/video-card-skeleton.dart';

class PlayVideoScreen extends StatefulWidget {
  final String id;
  final String videoSrc;
  final String playlistId;
  const PlayVideoScreen(
      {Key? key,
      required this.id,
      required this.videoSrc,
      required this.playlistId})
      : super(key: key);

  @override
  State<PlayVideoScreen> createState() =>
      _PlayVideoScreenState(id: id, videoSrc: videoSrc, playlistId: playlistId);
}

class _PlayVideoScreenState extends State<PlayVideoScreen> {
  final String id;
  final String videoSrc;
  final String playlistId;
  _PlayVideoScreenState(
      {required this.id, required this.videoSrc, required this.playlistId});

  late CachedVideoPlayerController _videoPlayerController,
      _videoPlayerController2,
      _videoPlayerController3;

  late CustomVideoPlayerController _customVideoPlayerController;
  late CustomVideoPlayerWebController _customVideoPlayerWebController;

  final CustomVideoPlayerSettings _customVideoPlayerSettings =
      const CustomVideoPlayerSettings(showSeekButtons: true);

  // final CustomVideoPlayerWebSettings _customVideoPlayerWebSettings =
  //     CustomVideoPlayerWebSettings(
  //   src: videoSrc,
  // );

  @override
  void initState() {
    super.initState();

    _videoPlayerController = CachedVideoPlayerController.network(
      videoSrc,
    )..initialize().then((value) => setState(() {}));
    // _videoPlayerController2 = CachedVideoPlayerController.network(video240);
    // _videoPlayerController3 = CachedVideoPlayerController.network(video480);
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
      customVideoPlayerSettings: _customVideoPlayerSettings,
      additionalVideoSources: {
        // "240p": _videoPlayerController2,
        // "480p": _videoPlayerController3,
        "720p": _videoPlayerController,
      },
    );

    // _customVideoPlayerWebController = CustomVideoPlayerWebController(
    //   webVideoPlayerSettings: _customVideoPlayerWebSettings,
    // );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    String lectureVideoQuery =
        """query Get_Lectures_Video(\$input: CommonMatchInput!){
  lecturesVideo(input: \$input){
    _id
    title
    lecturer
    video
    thumbnail
    likeCount
    viewsCount
    createdAt
  }
}""";

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
      backgroundColor: Colors.grey[100],
      body: SafeArea(
          child: Query(
              options:
                  QueryOptions(document: gql(lectureVideoQuery), variables: {
                "input": {"key": "_id", "operator": "eq", "value": id}
              }),
              builder: (result, {FetchMore? fetchMore, VoidCallback? refetch}) {
                if (result.hasException) {
                  print("Query Result: ${result.hasException}");
                }
                final data = result.data?['lecturesVideo'];

                return result.isLoading
                    ? const VideoCardSkeleton()
                    : Column(
                        children: <Widget>[
                          CustomVideoPlayer(
                            customVideoPlayerController:
                                _customVideoPlayerController,
                          ),
                          Container(
                              decoration:
                                  BoxDecoration(color: Colors.grey.shade200),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: InkWell(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['title'],
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        data['lecturer'],
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Flex(
                                        direction: Axis.horizontal,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${data['viewsCount']} views",
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black45),
                                          ),
                                          const SizedBox(
                                            width: 7,
                                          ),
                                          Text(
                                            DateFormat('yyyy-MM-dd').format(
                                                DateTime.parse(
                                                    data['createdAt'])),
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black45),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          Expanded(
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
                                            "value": playlistId
                                          }
                                        }
                                      }),
                                  builder: (result,
                                      {FetchMore? fetchMore,
                                      VoidCallback? refetch}) {
                                    if (result.hasException) {
                                      print(
                                          "Query Result: ${result.hasException}");
                                    }

                                    // store raw list
                                    List data =
                                        result.data?['lecturesVideos']["nodes"];

                                    // filter list
                                    List filteredData = data
                                        .where(
                                            (element) => element["_id"] != id)
                                        .toList();

                                    return result.isLoading
                                        ? ListView.builder(
                                            padding: const EdgeInsets.all(10),
                                            itemCount: 12,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return const CardCommonSkeleton();
                                            })
                                        : RefreshIndicator(
                                            triggerMode:
                                                RefreshIndicatorTriggerMode
                                                    .onEdge,
                                            edgeOffset: 0,
                                            displacement: 30,
                                            key: _refreshIndicatorKey,
                                            color: Colors.orange,
                                            backgroundColor: Colors.black,
                                            strokeWidth: 3.0,
                                            onRefresh: () async {
                                              // refetch query after refresh
                                              refetch!();
                                              return Future<void>.delayed(
                                                  const Duration(seconds: 3));
                                            },
                                            // Pull from top to show refresh indicator.
                                            child: filteredData.isEmpty &&
                                                    !result.isLoading
                                                ? const EmptyState(
                                                    label: "I am empty :(",
                                                    tagline:
                                                        "You have no video")
                                                : ListView.builder(
                                                    // shrinkWrap: true,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10,
                                                        vertical: 5),
                                                    itemCount:
                                                        filteredData.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return VideoCard(
                                                        video:
                                                            filteredData[index],
                                                        playlistId: playlistId,
                                                      );
                                                    }),
                                          );
                                  }))
                        ],
                      );
              })),
    );
  }

  Container _lectureVideoCard(
      BuildContext context, PlaylistVideoDataModel video) {
    String formatter = DateFormat('yMd').format(video.createdAt);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: InkWell(
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => const PlayVideoScreen(),
            //   ),
            // );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FadeInImage.assetNetwork(
                placeholder: 'assets/images/placeholder_image.png',
                image: video.thumbnail,
                width: 100,
                height: 60,
                fit: BoxFit.cover,
                placeholderFit: BoxFit.contain,
              ),
              const SizedBox(
                width: 15,
              ),
              Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      video.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${video.views} views",
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          formatter,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45),
                        ),
                      ],
                    )
                  ],
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
