import 'package:flutter/material.dart';
import 'package:ttp_app/screens/home/utils/dataModel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Row(
            children: [
              Image.asset(
                "assets/images/logo.png",
                scale: 3,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "Taliban Pakistan",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () => {},
                icon: const Icon(
                  Icons.dark_mode_outlined,
                  size: 28,
                  color: Colors.black,
                )),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 0,
                    childAspectRatio: 9 / 9),
                itemCount: homeMenu.length,
                itemBuilder: (context, i) {
                  return _moduleButton(context, homeMenu[i]);
                })));
  }

  // _moduleButton
  TextButton _moduleButton(BuildContext context, dynamic menu) {
    return TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => menu?.screen,
            ),
          );
        },
        child: Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  menu?.icon,
                  scale: 4,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  menu?.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                )
              ],
            )));
  }
}
