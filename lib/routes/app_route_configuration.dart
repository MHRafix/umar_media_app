import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ttp_app/app_view.dart';
import 'package:ttp_app/routes/app_route_constant.dart';
import 'package:ttp_app/screens/books/views/book_list.dart';
import 'package:ttp_app/screens/books/views/book_departments.dart';
import 'package:ttp_app/screens/fitnah/views/fitnah.dart';
import 'package:ttp_app/screens/history/views/history.dart';
import 'package:ttp_app/screens/home/views/home_screen.dart';
import 'package:ttp_app/screens/lectures/views/lecture_playlist_videos.dart';
import 'package:ttp_app/screens/lectures/views/lectures_playlists.dart';
import 'package:ttp_app/screens/lectures/views/play_video.dart';
import 'package:ttp_app/screens/news/views/news.dart';
import 'package:ttp_app/screens/others/views/others.dart';
import 'package:ttp_app/screens/tafseer/views/tafseer.dart';
import 'package:ttp_app/screens/talim/views/talim.dart';
import 'package:ttp_app/screens/war/views/war.dart';

class AppRouter {
  GoRouter goRouter = GoRouter(
      initialLocation: "/",
      navigatorKey: goRouteNavigatorStateKey,
      routes: [
        GoRoute(
          path: "/",
          name: AppRouteConstants.kHomeScreen,
          pageBuilder: (context, state) =>
              const MaterialPage(child: HomeScreen()),
        ),
        GoRoute(
          path: "/news",
          name: AppRouteConstants.kNewsScreen,
          pageBuilder: (context, state) =>
              const MaterialPage(child: NewsScreen()),
        ),
        GoRoute(
          path: "/lectures",
          name: AppRouteConstants.kLecturesPlaylistsScreen,
          pageBuilder: (context, state) =>
              const MaterialPage(child: LecturesPlaylistsScreen()),
        ),
        GoRoute(
          path: "/tafseer",
          name: AppRouteConstants.kTafseerScreen,
          pageBuilder: (context, state) =>
              const MaterialPage(child: TafseerScreen()),
        ),
        GoRoute(
          path: "/books",
          name: AppRouteConstants.kBooksScreen,
          pageBuilder: (context, state) =>
              const MaterialPage(child: BooksScreen()),
        ),
        GoRoute(
          path: "/book_lists",
          name: AppRouteConstants.kBookListScreen,
          pageBuilder: (context, state) =>
              const MaterialPage(child: BookListScreen()),
        ),
        GoRoute(
          path: "/war",
          name: AppRouteConstants.kWarScreen,
          pageBuilder: (context, state) =>
              const MaterialPage(child: WarScreen()),
        ),
        GoRoute(
          path: "/history",
          name: AppRouteConstants.kHistoryScreen,
          pageBuilder: (context, state) =>
              const MaterialPage(child: HistoryScreen()),
        ),
        GoRoute(
          path: "/talim",
          name: AppRouteConstants.kTalimScreen,
          pageBuilder: (context, state) =>
              const MaterialPage(child: TalimScreen()),
        ),
        GoRoute(
          path: "/fitnah",
          name: AppRouteConstants.kFitnahScreen,
          pageBuilder: (context, state) =>
              const MaterialPage(child: FitnahScreen()),
        ),
        GoRoute(
          path: "/others",
          name: AppRouteConstants.kOthersScreen,
          pageBuilder: (context, state) =>
              const MaterialPage(child: OthersScreen()),
        ),
        GoRoute(
          path: "/playlistDetails",
          name: AppRouteConstants.kLecturePlaylistVideosScreen,
          pageBuilder: (context, state) =>
              MaterialPage(child: LecturePlaylistVideosScreen()),
        ),
        GoRoute(
          path: "/play_video",
          name: AppRouteConstants.kPlayVideoScreen,
          pageBuilder: (context, state) =>
              const MaterialPage(child: PlayVideoScreen()),
        ),
      ]);
}
