import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ttp_app/screens/lectures/views/play_video.dart';

class VideoCard extends StatelessWidget {
  final Map<String, dynamic> video;
  const VideoCard({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    String formatter =
        DateFormat('yMd').format(DateTime.parse(video['createdAt']));

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PlayVideoScreen(id: video["_id"]),
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
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      video['lecturer'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.clip,
                      ),
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
