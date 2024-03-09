import 'package:ttp_app/screens/books/views/books.dart';
import 'package:ttp_app/screens/fitnah/views/fitnah.dart';
import 'package:ttp_app/screens/history/views/history.dart';
import 'package:ttp_app/screens/lectures/views/lectures.dart';
import 'package:ttp_app/screens/news/views/news.dart';
import 'package:ttp_app/screens/others/views/others.dart';
import 'package:ttp_app/screens/tafseer/views/tafseer.dart';
import 'package:ttp_app/screens/talim/views/talim.dart';
import 'package:ttp_app/screens/war/views/war.dart';

class Data {
  String title;
  String icon;
  dynamic screen;

  Data({required this.title, required this.icon, required this.screen});
}

List products = [
  Data(
      title: "শেষ খবর",
      icon: "assets/images/news.png",
      screen: const NewsScreen()),
  Data(
      title: "তাফসীর",
      icon: "assets/images/tafseer.png",
      screen: const TafseerScreen()),
  Data(
      title: "বই সমূহ",
      icon: "assets/images/books.png",
      screen: const BooksScreen()),
  Data(
      title: "বক্তব্য সিরিজ",
      icon: "assets/images/lecture.png",
      screen: const LecturesScreen()),
  Data(
      title: "গেরিলা যুদ্ধ",
      icon: "assets/images/war.png",
      screen: const WarScreen()),
  Data(
      title: "ইতিহাস",
      icon: "assets/images/history.png",
      screen: const HistoryScreen()),
  Data(
      title: "তালিম",
      icon: "assets/images/talim.png",
      screen: const TalimScreen()),
  Data(
      title: "ফিতনা",
      icon: "assets/images/fitnah.png",
      screen: const FitnahScreen()),
  Data(
      title: "অন্যান্য",
      icon: "assets/images/others.png",
      screen: const OthersScreen()),
];


  // Data(
  //     title: "ফাজায়েল",
  //     icon: "assets/images/fazael.png",
  //     screen: const NewsScreen()),


  // Data(
  //     title: "মাসায়েল",
  //     icon: "assets/images/masael.png",
  //     screen: const NewsScreen()),