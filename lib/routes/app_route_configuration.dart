import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:umar_media/app_view.dart';
import 'package:umar_media/routes/app_route_constant.dart';
import 'package:umar_media/screens/books/views/book_departments.dart';
import 'package:umar_media/screens/books/views/book_list.dart';
import 'package:umar_media/screens/settings/views/settings.dart';
import 'package:umar_media/screens/home/views/controll_screen.dart';
import 'package:umar_media/screens/lectures/views/lecture_playlist_videos.dart';
import 'package:umar_media/screens/lectures/views/lectures_playlists.dart';
import 'package:umar_media/screens/lectures/views/play_video.dart';
import 'package:umar_media/screens/news/views/news.dart';

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
          pageBuilder: (context, state) => MaterialPage(child: NewsScreen()),
        ),
        GoRoute(
          path: "/lectures",
          name: AppRouteConstants.kLecturesPlaylistsScreen,
          pageBuilder: (context, state) =>
              MaterialPage(child: LecturesPlaylistsScreen()),
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
          path: "/fitnah",
          name: AppRouteConstants.kFitnahScreen,
          pageBuilder: (context, state) =>
              const MaterialPage(child: SettingsScreen()),
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
