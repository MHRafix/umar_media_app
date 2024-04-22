import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ttp_app/screens/home/utils/dataModel.dart';

class PlayVideoScreen extends StatefulWidget {
  const PlayVideoScreen({Key? key}) : super(key: key);

  @override
  State<PlayVideoScreen> createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends State<PlayVideoScreen> {
  late CachedVideoPlayerController _videoPlayerController,
      _videoPlayerController2,
      _videoPlayerController3;

  late CustomVideoPlayerController _customVideoPlayerController;
  late CustomVideoPlayerWebController _customVideoPlayerWebController;

  final CustomVideoPlayerSettings _customVideoPlayerSettings =
      const CustomVideoPlayerSettings(showSeekButtons: true);

  final CustomVideoPlayerWebSettings _customVideoPlayerWebSettings =
      CustomVideoPlayerWebSettings(
    src: longVideo,
  );

  @override
  void initState() {
    super.initState();

    _videoPlayerController = CachedVideoPlayerController.network(
      longVideo,
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

    _customVideoPlayerWebController = CustomVideoPlayerWebController(
      webVideoPlayerSettings: _customVideoPlayerWebSettings,
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          //replace with our own icon data.
        ),
        title: const Text(
          "তাওহীদ এবং আকিদা",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        titleSpacing: 00.0,
        toolbarHeight: 60.2,
        toolbarOpacity: .9,
        elevation: 0.00,
        backgroundColor: Colors.grey[100],
        actions: [
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.dark_mode_outlined,
                size: 28,
                color: Colors.black,
              )),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          CustomVideoPlayer(
            customVideoPlayerController: _customVideoPlayerController,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: InkWell(
                child: Column(
                  children: [
                    Text(
                      "আকিদা সিরিজ - ৪র্থ পর্ব - তাওহিদুর রুবুবিয়্যাহ | Shaikh Tamim Al Adnani",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "23.5k views",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "2d ago",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  // shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  itemCount: playlistVideos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _lectureVideoCard(context, playlistVideos[index]);
                  }))
        ],
      )),
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PlayVideoScreen(),
              ),
            );
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

String longVideo =
    "https://res.cloudinary.com/coderxone/video/upload/v1713246860/ad4zu5v95tjtpwnz9xbh.mp4";

// String video720 =
//     "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";

// String video480 =
//     "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";

// String video240 =
//     "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
