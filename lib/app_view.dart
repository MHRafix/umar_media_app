import 'package:flutter/material.dart';
import 'package:ttp_app/screens/books/views/books.dart';
import 'package:ttp_app/screens/fitnah/views/fitnah.dart';
import 'package:ttp_app/screens/history/views/history.dart';
import 'package:ttp_app/screens/home/views/home_screen.dart';
import 'package:ttp_app/screens/lectures/views/lecture_playlist_videos.dart';
import 'package:ttp_app/screens/lectures/views/lectures_playlists.dart';
import 'package:ttp_app/screens/news/views/news.dart';
import 'package:ttp_app/screens/others/views/others.dart';
import 'package:ttp_app/screens/tafseer/views/tafseer.dart';
import 'package:ttp_app/screens/talim/views/talim.dart';
import 'package:ttp_app/screens/war/views/war.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food Delivery",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.light(
              background: Colors.grey.shade300,
              onBackground: Colors.black,
              primary: Colors.blue,
              onPrimary: Colors.white)),
      // home: const HomeScreen(),
      routes: {
        '/': (context) => const HomeScreen(),
        '/news': (context) => const NewsScreen(),
        '/lectures': (context) => const LecturesPlaylistsScreen(),
        '/tafseer': (context) => const TafseerScreen(),
        '/books': (context) => const BooksScreen(),
        '/war': (context) => const WarScreen(),
        '/history': (context) => const HistoryScreen(),
        '/talim': (context) => const TalimScreen(),
        '/fitnah': (context) => const FitnahScreen(),
        '/others': (context) => const OthersScreen(),
        '/playlistDetails:id': (context) => const LecturePlaylistVideosScreen(),
      },
    );
  }
}
