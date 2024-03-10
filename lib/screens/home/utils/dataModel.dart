import 'package:ttp_app/screens/books/views/books.dart';
import 'package:ttp_app/screens/fitnah/views/fitnah.dart';
import 'package:ttp_app/screens/history/views/history.dart';
import 'package:ttp_app/screens/lectures/views/lectures_playlists.dart';
import 'package:ttp_app/screens/news/views/news.dart';
import 'package:ttp_app/screens/others/views/others.dart';
import 'package:ttp_app/screens/tafseer/views/tafseer.dart';
import 'package:ttp_app/screens/talim/views/talim.dart';
import 'package:ttp_app/screens/war/views/war.dart';

class HomeMenuData {
  String title;
  String icon;
  dynamic screen;

  HomeMenuData({required this.title, required this.icon, required this.screen});
}

List homeMenu = [
  HomeMenuData(
      title: "শেষ খবর",
      icon: "assets/images/news.png",
      screen: const NewsScreen()),
  HomeMenuData(
      title: "তাফসীর",
      icon: "assets/images/tafseer.png",
      screen: const TafseerScreen()),
  HomeMenuData(
      title: "বই সমূহ",
      icon: "assets/images/books.png",
      screen: const BooksScreen()),
  HomeMenuData(
      title: "বক্তব্য সিরিজ",
      icon: "assets/images/lecture.png",
      screen: const LecturesPlaylistsScreen()),
  HomeMenuData(
      title: "গেরিলা যুদ্ধ",
      icon: "assets/images/war.png",
      screen: const WarScreen()),
  HomeMenuData(
      title: "ইতিহাস",
      icon: "assets/images/history.png",
      screen: const HistoryScreen()),
  HomeMenuData(
      title: "তালিম",
      icon: "assets/images/talim.png",
      screen: const TalimScreen()),
  HomeMenuData(
      title: "ফিতনা",
      icon: "assets/images/fitnah.png",
      screen: const FitnahScreen()),
  HomeMenuData(
      title: "অন্যান্য",
      icon: "assets/images/others.png",
      screen: const OthersScreen()),
];

// playlist fake data
class PlaylistDataModel {
  String name;
  String image;
  int id;
  int items;

  PlaylistDataModel(
      {required this.name,
      required this.image,
      required this.id,
      required this.items});
}

List playlistData = [
  PlaylistDataModel(
      name: "তাওহীদ এবং আকিদা",
      image: "https://cdn-icons-png.flaticon.com/128/3165/3165231.png",
      id: 3,
      items: 350),
  PlaylistDataModel(
      name: "আল ওয়ালা ওয়াল বারা",
      image: "https://cdn-icons-png.flaticon.com/128/7959/7959330.png",
      id: 4,
      items: 5),
  PlaylistDataModel(
      name: "জিহাদ ফি-সাবিলিল্লাহ",
      image: "https://cdn-icons-png.flaticon.com/128/7882/7882005.png",
      id: 5,
      items: 5),
  PlaylistDataModel(
      name: "সালাতের গুরুত্ব ",
      image: "https://cdn-icons-png.flaticon.com/128/3167/3167301.png",
      id: 8,
      items: 199),
  PlaylistDataModel(
      name: "রমাদান এবং সিয়ামের গুরুত্ব",
      image: "https://cdn-icons-png.flaticon.com/128/5173/5173601.png",
      id: 9,
      items: 34),
  PlaylistDataModel(
      name: "হজ্জের ফরজিয়াত",
      image: "https://cdn-icons-png.flaticon.com/128/7195/7195414.png",
      id: 10,
      items: 24),
  PlaylistDataModel(
      name: "হিজরাতের গুরুত্ব",
      image: "https://cdn-icons-png.flaticon.com/128/879/879397.png",
      id: 11,
      items: 09),
  PlaylistDataModel(
      name: "ইসলামের ইতিহাস",
      image: "https://cdn-icons-png.flaticon.com/128/9019/9019000.png",
      id: 12,
      items: 232),
  PlaylistDataModel(
      name: "খিলাফা এবং ইমারাত কনসেপ্ট",
      image: "https://cdn-icons-png.flaticon.com/128/3224/3224373.png",
      id: 13,
      items: 133),
  PlaylistDataModel(
      name: "যাকাত",
      image: "https://cdn-icons-png.flaticon.com/128/625/625599.png",
      id: 6,
      items: 10),
  PlaylistDataModel(
      name: "দান এবং সদাকা ",
      image: "https://cdn-icons-png.flaticon.com/128/14728/14728179.png",
      id: 7,
      items: 15),
  PlaylistDataModel(
      id: 1,
      name: "ফাজায়েলে আমল",
      image: "https://cdn-icons-png.flaticon.com/128/2714/2714093.png",
      items: 123),
  PlaylistDataModel(
      name: "মাসায়েল জিজ্ঞাসা",
      image: "https://cdn-icons-png.flaticon.com/128/7049/7049859.png",
      id: 2,
      items: 32),
];
