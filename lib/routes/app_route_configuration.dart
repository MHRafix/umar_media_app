import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:umar_media/app_view.dart';
import 'package:umar_media/routes/app_route_constant.dart';
import 'package:umar_media/screens/books/views/book_departments.dart';
import 'package:umar_media/screens/books/views/book_list.dart';
import 'package:umar_media/screens/fitnah/views/fitnah.dart';
import 'package:umar_media/screens/history/views/history.dart';
import 'package:umar_media/screens/home/views/controll_screen.dart';
import 'package:umar_media/screens/lectures/views/lecture_playlist_videos.dart';
import 'package:umar_media/screens/lectures/views/lectures_playlists.dart';
import 'package:umar_media/screens/lectures/views/play_video.dart';
import 'package:umar_media/screens/news/views/news.dart';
import 'package:umar_media/screens/others/views/others.dart';
import 'package:umar_media/screens/tafseer/views/tafseer.dart';
import 'package:umar_media/screens/talim/views/talim.dart';
import 'package:umar_media/screens/war/views/war.dart';

class AppRouter {
  GoRouter goRouter = GoRouter(
      initialLocation: "/",
      navigatorKey: goRouteNavigatorStateKey,
      routes: [
        GoRoute(
          path: "/",
          name: AppRouteConstants.kHomeScreen,
          pageBuilder: (context, state) => MaterialPage(child: ControlScreen()),
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
              MaterialPage(child: LecturesPlaylistsScreen()),
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
          pageBuilder: (context, state) => MaterialPage(child: BooksScreen()),
        ),
        GoRoute(
          path: "/book_lists",
          name: AppRouteConstants.kBookListScreen,
          pageBuilder: (context, state) => MaterialPage(
              child: BookListScreen(
            id: "",
            name: "",
          )),
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
          pageBuilder: (context, state) => MaterialPage(
              child: LecturePlaylistVideosScreen(
            id: "",
            name: "",
          )),
        ),
        GoRoute(
          path: "/play_video",
          name: AppRouteConstants.kPlayVideoScreen,
          pageBuilder: (context, state) => const MaterialPage(
              child: PlayVideoScreen(id: "", videoSrc: "", playlistId: "")),
        ),
      ]);
}
