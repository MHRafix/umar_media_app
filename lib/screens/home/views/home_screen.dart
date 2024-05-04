import 'package:flutter/material.dart';
import 'package:ttp_app/screens/home/utils/dataModel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Colors.grey[100],
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(
                //   "assets/images/logo.png",
                //   scale: 3,
                // ),
                // const SizedBox(
                //   width: 5,
                // ),
                Text(
                  "Ummah Media",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.teal,
                      letterSpacing: 2),
                )
              ],
            ),
            // actions: [
            //   IconButton(
            //       onPressed: () => {},
            //       icon: const Icon(
            //         Icons.dark_mode_outlined,
            //         size: 28,
            //         color: Colors.black,
            //       )),
            // ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                // FlutterCarousel(
                //   options: CarouselOptions(
                //     autoPlay: true,
                //     autoPlayInterval: const Duration(seconds: 5),
                //     disableCenter: true,
                //     viewportFraction: deviceSize.width > 800.0 ? 0.8 : 1.0,
                //     // height: 230,
                //     indicatorMargin: 12.0,
                //     enableInfiniteScroll: true,
                //     slideIndicator: const CircularSlideIndicator(),
                //   ),
                //   items: sliders,
                // ),

                // const Scrollbar(
                //     scrollbarOrientation: ScrollbarOrientation.right,
                //     child: Text("Hello")),

                Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: homeMenu.length,
                      itemBuilder: (context, i) {
                        return _gridModuleBox(context, homeMenu[i]);
                      }),
                ),
              ],
            ),
          ),
        ));
  }

  // _moduleButton
  Container _gridModuleBox(BuildContext context, dynamic menu) {
    return Container(
        // color: Colors.grey[200],
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10), // Set border radius here
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => menu?.screen,
              ),
            );
          },
          child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    menu?.icon,
                    // scale: 2,
                    width: 60,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    menu?.title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )),
        ));
  }
}
