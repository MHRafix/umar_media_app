import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Map<String, dynamic> book;
  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[500]!, width: .1),
        color: Colors.white70,
      ),
      height: 110,
      // color: Colors.grey[500],
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: InkWell(
          // borderRadius: BorderRadius.circular(20),
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => const BookListScreen(),
            //   ),
            // );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FadeInImage.assetNetwork(
                placeholder: 'assets/images/placeholder_image.png',
                image: book['cover'],
                width: 80,
                height: 110,
                fit: BoxFit.cover,
                placeholderFit: BoxFit.cover,
              ),
              const SizedBox(
                width: 15,
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          book["name"],
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Text(
                          "${book['writer'].substring(0, 20)}",
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            maximumSize: const Size(100, 50),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 2),
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              // Adjust the radius as needed
                            ),
                            // Adjust the size as per your requirement
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.menu_book,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Read',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    IconButton(
                      onPressed: () {},
                      style: IconButton.styleFrom(
                          backgroundColor: Colors.grey[400]),
                      icon: const Icon(
                        Icons.download_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
