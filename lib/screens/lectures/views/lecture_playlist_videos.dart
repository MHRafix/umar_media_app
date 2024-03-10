import 'package:flutter/material.dart';

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
          "Playlist Details",
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
    );
  }
}
