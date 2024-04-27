import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ttp_app/widgets/common-widgets/empty-state/empty-state.dart';
import 'package:ttp_app/widgets/common-widgets/shimmer-widgets.dart';

class BookListScreen extends StatelessWidget {
  final String id;
  final String name;
  const BookListScreen({super.key, required this.id, required this.name});

  // ScreenB({required });

  @override
  Widget build(BuildContext context) {
    print(context);
    String bookListByDepartmentQuery =
        """query Books_By_Departments_Query(\$input: BookListQueryDto){
  books(input: \$input){
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
          title: Text(
            name,
            style: const TextStyle(
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
          backgroundColor: Colors.grey[300],
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
          options: QueryOptions(
              document: gql(bookListByDepartmentQuery),
              variables: {
                "input": {
                  "where": {"key": "department", "operator": "eq", "value": id}
                }
              }),
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
                ? ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: 12,
                    itemBuilder: (BuildContext context, int index) {
                      return bookListSkeletons();
                    })
                : data['nodes']?.length == 0 && !result.isLoading
                    ? const EmptyState(label: "No books found")
                    : ListView.builder(
                        clipBehavior: Clip.hardEdge,
                        padding: const EdgeInsets.all(
                            5.0), // padding around the grid
                        itemCount:
                            data?["nodes"].length, // total number of items
                        itemBuilder: (context, index) {
                          return _booksCard(context, data?["nodes"][index]);
                        },
                      );

            // }
          },
        ));
  }

// book card
  Container _booksCard(BuildContext context, Map<String, dynamic> book) {
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

// book department skeleton
  Widget bookListSkeletons() => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.white70,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                offset: const Offset(
                  1.0,
                  1.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              )
            ]),
        margin: const EdgeInsets.symmetric(vertical: 5),
        // height: 80,
        alignment: Alignment.center,
        child: const ListTile(
          leading: ShimmerWidget.rectangular(
            height: 80,
            width: 60,
            // shapeBorder:
            //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          title: ShimmerWidget.rectangular(
            height: 18,
          ),
          subtitle: ShimmerWidget.rectangular(
            height: 14,
          ),
          trailing: ShimmerWidget.circular(height: 45, width: 45),
        ),
      );
}
