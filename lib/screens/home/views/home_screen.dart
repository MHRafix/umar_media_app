import 'package:flutter/material.dart';
import 'package:ttp_app/screens/news/views/news.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Row(
            children: [
              Image.network(
                "https://cdn-icons-png.flaticon.com/128/9001/9001104.png",
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
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  childAspectRatio: 9 / 9),
              itemCount: 1200,
              itemBuilder: (context, i) {
                return TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NewsScreen(),
                        ),
                      );
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/128/4358/4358773.png",
                              scale: 4,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "তাফসীর",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ))

                    // Container(
                    //   // decoration: BoxDecoration(
                    //   //     color: Colors.white,
                    //   //     borderRadius: BorderRadius.circular(5),
                    //   //     boxShadow: [
                    //   //       BoxShadow(
                    //   //           color: Colors.grey.shade300,
                    //   //           blurRadius: 5,
                    //   //           offset: const Offset(3, 3)),
                    //   //     ]),

                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.all(20),
                    //         child: Image.network(
                    //           "https://cdn-icons-png.flaticon.com/128/4358/4358773.png",
                    //           scale: 2,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )

                    );
              }),
        ));
  }
}
