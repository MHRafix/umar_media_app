import 'package:flutter/material.dart';
import 'package:umar_media/screens/books/views/book_departments.dart';
import 'package:umar_media/screens/fitnah/views/fitnah.dart';
import 'package:umar_media/screens/home/views/home_screen.dart';
import 'package:umar_media/screens/lectures/views/lectures_playlists.dart';
import 'package:umar_media/screens/news/views/news.dart';

class ControlScreen extends StatefulWidget {
  const ControlScreen({super.key});

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  int _currentIndex = 0;
  List<Widget> widgetList = [
    HomeScreen(),
    BooksScreen(),
    NewsScreen(),
    LecturesPlaylistsScreen(),
    FitnahScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(87, 5, 10, 81),
      body: widgetList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => {
          setState(() {
            _currentIndex = index;
          })
        },
        backgroundColor: Color.fromRGBO(3, 25, 59, 1),
        // fixedColor: Color.fromRGBO(127, 119, 255, 1),
        selectedItemColor: Color.fromRGBO(119, 110, 249, 1),
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Color.fromRGBO(46, 46, 108, 1),
        elevation: 0,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded), label: "Books"),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "News"),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library), label: "Lectures"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
