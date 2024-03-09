import 'package:flutter/material.dart';
import 'package:ttp_app/screens/home/utils/dataModel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Tehrik-i Taliban Pakistan",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              )
            ],
          ),
          // actions: [
          //   Image.network(
          //     "https://cdn-peanutsquare.b-cdn.net/wp-content/uploads/2020/08/client2.png",
          //     scale: 3,
          //   ),
          //   IconButton(onPressed: () => {}, icon: const Icon(Icons.logout)),
          // ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 0,
                    childAspectRatio: 9 / 9),
                itemCount: products.length,
                itemBuilder: (context, i) {
                  return _moduleButton(context, products[i]);
                })));
  }

  // _moduleButton
  TextButton _moduleButton(BuildContext context, dynamic product) {
    return TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => product?.screen,
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
                  product?.icon,
                  scale: 4,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  product?.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                )
              ],
            )));
  }
}
