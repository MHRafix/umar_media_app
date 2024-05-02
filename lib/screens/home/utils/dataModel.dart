import 'package:ttp_app/screens/books/views/book_departments.dart';
import 'package:ttp_app/screens/fitnah/views/fitnah.dart';
import 'package:ttp_app/screens/history/views/history.dart';
import 'package:ttp_app/screens/lectures/views/lectures_playlists.dart';
import 'package:ttp_app/screens/news/views/news.dart';
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
      title: "বই সমূহ", icon: "assets/images/books.png", screen: BooksScreen()),
  HomeMenuData(
      title: "বক্তব্য সিরিজ",
      icon: "assets/images/lecture.png",
      screen: LecturesPlaylistsScreen()),
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
  // HomeMenuData(
  //     title: "অন্যান্য",
  //     icon: "assets/images/others.png",
  //     screen: const OthersScreen()),
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

// playlist videos fake data
class PlaylistVideoDataModel {
  String name;
  String thumbnail;
  int id;
  int views;
  DateTime createdAt;

  PlaylistVideoDataModel({
    required this.name,
    required this.thumbnail,
    required this.id,
    required this.views,
    required this.createdAt,
  });
}

List playlistVideos = [
  PlaylistVideoDataModel(
      name: "তাওহীদ এবং আকিদা",
      thumbnail:
          "https://i.ytimg.com/vi/SJKApCZACVE/hqdefault.jpg?sqp=-oaymwEcCNACELwBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLC-cLhi4RVdHICUkYrcNGDb8z2euA",
      id: 3,
      views: 350,
      createdAt: DateTime(2024, 9, 7, 14, 37)),
  PlaylistVideoDataModel(
      name: "আল ওয়ালা ওয়াল বারা",
      thumbnail:
          "https://i.ytimg.com/vi/exfytj5RSyM/hqdefault.jpg?sqp=-oaymwEcCNACELwBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLBl6iYHDK9GQsdRC_DvohzV52kVLg",
      id: 4,
      views: 5,
      createdAt: DateTime(2024, 9, 7, 14, 37)),
  PlaylistVideoDataModel(
      name: "জিহাদ ফি-সাবিলিল্লাহ",
      thumbnail:
          "https://i.ytimg.com/vi/KPevm4z05H8/hqdefault.jpg?sqp=-oaymwExCNACELwBSFryq4qpAyMIARUAAIhCGAHwAQH4Af4JgALQBYoCDAgAEAEYTiBlKGMwDw==&rs=AOn4CLDKf_wCL06L6gYJjhFtbldYH0Ywcw",
      id: 5,
      views: 5,
      createdAt: DateTime(2024, 9, 7, 14, 37)),
  PlaylistVideoDataModel(
      name: "সালাতের গুরুত্ব ",
      thumbnail:
          "https://i.ytimg.com/vi/2a14ThdSJFY/hqdefault.jpg?sqp=-oaymwE2CNACELwBSFXyq4qpAygIARUAAIhCGAFwAcABBvABAfgB_gmAAtAFigIMCAAQARhlIGUoZTAP&rs=AOn4CLAiIfMix7iufLSc8jZKHyo4PFeORw",
      id: 8,
      views: 199,
      createdAt: DateTime(2024, 9, 7, 14, 37)),
  PlaylistVideoDataModel(
      name: "রমাদান এবং সিয়ামের গুরুত্ব",
      thumbnail:
          "https://i.ytimg.com/vi/2a14ThdSJFY/hqdefault.jpg?sqp=-oaymwE2CNACELwBSFXyq4qpAygIARUAAIhCGAFwAcABBvABAfgB_gmAAtAFigIMCAAQARhlIGUoZTAP&rs=AOn4CLAiIfMix7iufLSc8jZKHyo4PFeORw",
      id: 9,
      views: 34,
      createdAt: DateTime(2024, 9, 7, 14, 37)),
  PlaylistVideoDataModel(
      name: "হজ্জের ফরজিয়াত",
      thumbnail:
          "https://i.ytimg.com/vi/436j1D2BV-c/hqdefault.jpg?sqp=-oaymwEcCNACELwBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCqKeo0dPQ4IKLAGbZWM2k2OgmSVA",
      id: 10,
      views: 24,
      createdAt: DateTime(2024, 9, 7, 14, 37)),
  PlaylistVideoDataModel(
      name: "হিজরাতের গুরুত্ব",
      thumbnail:
          "https://i.ytimg.com/vi/w2GztA360I4/hqdefault.jpg?sqp=-oaymwEcCNACELwBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCTPA4fMAAQDFydu2D0lUol5hDg5Q",
      id: 11,
      views: 09,
      createdAt: DateTime(2024, 9, 7, 14, 37)),
  PlaylistVideoDataModel(
      name: "জিহাদ ফি-সাবিলিল্লাহ",
      thumbnail:
          "https://i.ytimg.com/vi/KPevm4z05H8/hqdefault.jpg?sqp=-oaymwExCNACELwBSFryq4qpAyMIARUAAIhCGAHwAQH4Af4JgALQBYoCDAgAEAEYTiBlKGMwDw==&rs=AOn4CLDKf_wCL06L6gYJjhFtbldYH0Ywcw",
      id: 5,
      views: 5,
      createdAt: DateTime(2024, 9, 7, 14, 37)),
  PlaylistVideoDataModel(
      name: "সালাতের গুরুত্ব ",
      thumbnail:
          "https://i.ytimg.com/vi/2a14ThdSJFY/hqdefault.jpg?sqp=-oaymwE2CNACELwBSFXyq4qpAygIARUAAIhCGAFwAcABBvABAfgB_gmAAtAFigIMCAAQARhlIGUoZTAP&rs=AOn4CLAiIfMix7iufLSc8jZKHyo4PFeORw",
      id: 8,
      views: 199,
      createdAt: DateTime(2024, 9, 7, 14, 37)),
  PlaylistVideoDataModel(
      name: "রমাদান এবং সিয়ামের গুরুত্ব",
      thumbnail:
          "https://i.ytimg.com/vi/2a14ThdSJFY/hqdefault.jpg?sqp=-oaymwE2CNACELwBSFXyq4qpAygIARUAAIhCGAFwAcABBvABAfgB_gmAAtAFigIMCAAQARhlIGUoZTAP&rs=AOn4CLAiIfMix7iufLSc8jZKHyo4PFeORw",
      id: 9,
      views: 34,
      createdAt: DateTime(2024, 9, 7, 14, 37)),
  PlaylistVideoDataModel(
      name: "ইসলামের ইতিহাস",
      thumbnail:
          "https://i.ytimg.com/vi/ehQms-uvkeM/hqdefault.jpg?sqp=-oaymwEcCNACELwBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCxqaIcwwsuclXj2AEj5aGe8WPnqg",
      id: 12,
      views: 232,
      createdAt: DateTime(2024, 9, 7, 14, 37)),
  PlaylistVideoDataModel(
      name: "জিহাদ ফি-সাবিলিল্লাহ",
      thumbnail:
          "https://i.ytimg.com/vi/KPevm4z05H8/hqdefault.jpg?sqp=-oaymwExCNACELwBSFryq4qpAyMIARUAAIhCGAHwAQH4Af4JgALQBYoCDAgAEAEYTiBlKGMwDw==&rs=AOn4CLDKf_wCL06L6gYJjhFtbldYH0Ywcw",
      id: 5,
      views: 5,
      createdAt: DateTime(2024, 9, 7, 14, 37)),
  PlaylistVideoDataModel(
      name: "সালাতের গুরুত্ব ",
      thumbnail:
          "https://i.ytimg.com/vi/2a14ThdSJFY/hqdefault.jpg?sqp=-oaymwE2CNACELwBSFXyq4qpAygIARUAAIhCGAFwAcABBvABAfgB_gmAAtAFigIMCAAQARhlIGUoZTAP&rs=AOn4CLAiIfMix7iufLSc8jZKHyo4PFeORw",
      id: 8,
      views: 199,
      createdAt: DateTime(2024, 9, 7, 14, 37)),
  PlaylistVideoDataModel(
      name: "রমাদান এবং সিয়ামের গুরুত্ব",
      thumbnail:
          "https://i.ytimg.com/vi/2a14ThdSJFY/hqdefault.jpg?sqp=-oaymwE2CNACELwBSFXyq4qpAygIARUAAIhCGAFwAcABBvABAfgB_gmAAtAFigIMCAAQARhlIGUoZTAP&rs=AOn4CLAiIfMix7iufLSc8jZKHyo4PFeORw",
      id: 9,
      views: 34,
      createdAt: DateTime(2024, 9, 7, 14, 37)),
];
