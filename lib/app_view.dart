import 'package:flutter/material.dart';
import 'package:ttp_app/screens/home/views/home_screen.dart';
import 'package:ttp_app/screens/news/views/news.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food Delivery",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.light(
              background: Colors.grey.shade100,
              onBackground: Colors.black,
              primary: Colors.blue,
              onPrimary: Colors.white)),
      // home: const HomeScreen(),
      routes: {
        '/': (context) => const HomeScreen(),
        '/news': (context) => const NewsScreen()
      },
    );
  }
}
