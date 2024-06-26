import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:umar_media/screens/lectures/views/play_video.dart';

class VideoCard extends StatelessWidget {
  final Map<String, dynamic> video;
  final String playlistId;
  const VideoCard({super.key, required this.video, required this.playlistId});

  @override
  Widget build(BuildContext context) {
    String formatter =
        DateFormat('yMd').format(DateTime.parse(video['createdAt']));

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PlayVideoScreen(
                  id: video["_id"],
                  videoSrc: video["video"],
                  playlistId: playlistId),
            ),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/placeholder_image.png',
              image: video['thumbnail'],
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
                    video['title'],
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.clip,
                        color: Colors.white),
                  ),
                  Text(
                    video['lecturer'],
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.clip,
                        color: Colors.white70),
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${video['views'] ?? 0} views",
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white38),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        formatter,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white38),
                      ),
                    ],
                  )
                ],
              ),
            ])
          ],
        ),
      ),
    );
  }
}
