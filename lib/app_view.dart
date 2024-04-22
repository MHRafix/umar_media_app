/*
-----------------------------------------------------------------------------
        Author: Md Maruf Ahmed Robin
        Title: Lead Mobile App Developer
        Email: marufrobin00@gmail.com
        GitHub: https://github.com/marufrobin
        Website: https://marufrobin.com
-----------------------------------------------------------------------------
  */

import 'package:flutter/material.dart';
import 'package:ttp_app/routes/app_route_configuration.dart';

import 'app_theme/theme_data.dart';

final appRouter = AppRouter();
GlobalKey<NavigatorState> goRouteNavigatorStateKey =
    GlobalKey<NavigatorState>();

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarBrightness: Brightness.light,
    //   statusBarIconBrightness: Brightness.dark,
    //   systemNavigationBarIconBrightness: Brightness.light,
    // ));
    return MaterialApp.router(
      // key: goRouteNavigatorStateKey,
      debugShowCheckedModeBanner: false,
      title: 'Pakistan',
      theme: themeData(context),
      routerConfig: appRouter.goRouter,
    );
  }
}
