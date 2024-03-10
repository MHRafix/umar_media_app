import 'package:flutter/material.dart';
import 'package:ttp_app/screens/home/utils/dataModel.dart';
import 'package:ttp_app/screens/lectures/views/lecture_playlist_videos.dart';

class LecturesPlaylistsScreen extends StatelessWidget {
  const LecturesPlaylistsScreen({super.key});

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
          // automaticallyImplyLeading: true,
          title: const Text(
            "Lecture Playlists",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),

          titleSpacing: 00.0,
          // centerTitle: true,
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
            padding: const EdgeInsets.all(10),
            itemCount: playlistData.length,
            itemBuilder: (BuildContext context, int index) {
              return _lecturePlaylistCard(context, playlistData[index]);
            }));
  }

  Container _lecturePlaylistCard(
      BuildContext context, PlaylistDataModel playlist) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white70,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(
                1.0,
                1.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            )
          ]),
      height: 75,
      // color: Colors.grey[500],
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
              Image.network(
                playlist.image,
                scale: 2.5,
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
                      playlist.name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${playlist.items} lectures",
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45),
                    ),
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
