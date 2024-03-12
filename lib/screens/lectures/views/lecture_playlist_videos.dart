import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ttp_app/screens/home/utils/dataModel.dart';

class LecturePlaylistVideosScreen extends StatelessWidget {
  const LecturePlaylistVideosScreen({super.key});

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
        body: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            itemCount: playlistVideos.length,
            itemBuilder: (BuildContext context, int index) {
              return _lectureVideoCard(context, playlistVideos[index]);
            }));
  }

  Container _lectureVideoCard(
      BuildContext context, PlaylistVideoDataModel video) {
    String formatter = DateFormat('yMd').format(video.createdAt);
    return Container(
      // decoration: const BoxDecoration(
      // borderRadius: BorderRadius.circular(20),
      // color: Colors.white70,
      // ),
      // height: 85,
      // color: Colors.grey[500],
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LecturePlaylistVideosScreen(),
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
