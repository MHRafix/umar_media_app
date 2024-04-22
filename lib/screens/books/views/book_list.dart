import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String bookListByDepartmentQuery = """query Books_By_Departments_Query{
  books{
    nodes{
      _id
      name
      cover
      file
      writer
      downloadCount
    }
  }
}""";

    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
            //replace with our own icon data.
          ),
          // automaticallyImplyLeading: true,
          title: const Text(
            "Book List",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),

          titleSpacing: 00.0,
          // centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: .9,
          elevation: 0.00,
          backgroundColor: Colors.grey[100],
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
        body: Query(
          options: QueryOptions(document: gql(bookListByDepartmentQuery)),
          builder: (
            result, {
            FetchMore? fetchMore,
            VoidCallback? refetch,
          }) {
            if (result.hasException) {
              print("Query Result: ${result.hasException}");
            }
            final data = result.data?['books'];

            return result.isLoading
                ? const Text("Loading...")
                : ListView.builder(
                    clipBehavior: Clip.hardEdge,
                    padding:
                        const EdgeInsets.all(5.0), // padding around the grid
                    itemCount: data?["nodes"].length, // total number of items
                    itemBuilder: (context, index) {
                      return _booksCard(context, data?["nodes"][index]);
                    },
                  );

            // }
          },
        ));
  }

  Container _bookCard(BuildContext context, Map<String, dynamic> book) {
    return Container(
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(10),
      //     color: Colors.white70,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.grey.shade200,
      //         offset: const Offset(
      //           1.0,
      //           1.0,
      //         ),
      //         blurRadius: 10.0,
      //         spreadRadius: 2.0,
      //       )
      //     ]),
      // color: Colors.grey[500],
      margin: const EdgeInsets.symmetric(vertical: 0),
      child: InkWell(
        // borderRadius: BorderRadius.circular(20),
        // onTap: () {
        //   Navigator.of(context).push(
        //     MaterialPageRoute(
        //       builder: (context) => const BookListScreen(),
        //     ),
        //   );
        // },
        child: Column(
          children: [
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/placeholder_image.png',
              image: book["cover"],
              width: 150,
              height: 150,
              fit: BoxFit.cover,
              placeholderFit: BoxFit.contain,
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${book["name"]}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  book["writer"],
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _booksCard(BuildContext context, Map<String, dynamic> book) {
    // print(book);
    return Container(
      // decoration: BoxDecoration(
      // borderRadius: BorderRadius.circular(20),
      // color: Colors.white70,
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.grey.shade200,
      //     offset: const Offset(
      //       1.0,
      //       1.0,
      //     ),
      //     blurRadius: 10.0,
      //     spreadRadius: 2.0,
      //   )
      // ]),
      height: 110,
      // color: Colors.grey[500],
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                          "${book['writer']}",
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
                      style: IconButton.styleFrom(backgroundColor: Colors.grey),
                      icon: const Icon(
                        Icons.download_sharp,
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
//  PopupMenuButton<int>(
//                 itemBuilder: (context) => [
//                   // popupmenu item 1
//                   const PopupMenuItem(
//                     value: 1,
//                     // row has two child icon and text.
//                     child: Row(
//                       children: [
//                         Icon(Icons.library_books_outlined),
//                         SizedBox(
//                           // sized box with width 10
//                           width: 10,
//                         ),
//                         Text("Read the book")
//                       ],
//                     ),
//                   ),
//                   // popupmenu item 2
//                   const PopupMenuItem(
//                     value: 2,
//                     // row has two child icon and text
//                     child: Row(
//                       children: [
//                         Icon(Icons.download),
//                         SizedBox(
//                           // sized box with width 10
//                           width: 10,
//                         ),
//                         Text("Download PDF")
//                       ],
//                     ),
//                   ),
//                 ],
//                 offset: const Offset(-10, 45),
//                 color: Colors.grey[50],
//                 elevation: 2,
//               ),
            