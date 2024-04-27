import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ttp_app/screens/books/views/book_list.dart';
import 'package:ttp_app/widgets/common-widgets/empty-state/empty-state.dart';
import 'package:ttp_app/widgets/common-widgets/shimmer-widgets.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String bookDepartmentsQuery = """query Book_Departments_Query{
  bookDepartments{
    nodes{
      _id
      name
      iconImage
      description
      booksCount
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
            "Book Departments",
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
          options: QueryOptions(document: gql(bookDepartmentsQuery)),
          builder: (result, {FetchMore? fetchMore, VoidCallback? refetch}) {
            if (result.hasException) {
              print("Query Result: ${result.hasException}");
            }
            final data = result.data?['bookDepartments'];

            return result.isLoading
                ? ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: 12,
                    itemBuilder: (BuildContext context, int index) {
                      return bookDepartmentSkeletons();
                    })
                : data['nodes']?.length == 0 && !result.isLoading
                    ? const EmptyState(label: "No books found")
                    : ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: data?["nodes"].length,
                        itemBuilder: (BuildContext context, int index) {
                          return _bookDepartmentCard(
                              context, data?["nodes"][index]);
                        });
            // }
          },
        ));
  }

// bool department card
  Container _bookDepartmentCard(
      BuildContext context, Map<String, dynamic> department) {
    // print(department);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
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
      height: 80,
      // color: Colors.grey[500],
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BookListScreen(
                    id: department['_id'], name: department["name"]),
              ),
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FadeInImage.assetNetwork(
                placeholder: 'assets/images/placeholder_image.png',
                image: department['iconImage'],
                width: 45,
                height: 45,
                fit: BoxFit.cover,
                placeholderFit: BoxFit.contain,
              ),
              const SizedBox(
                width: 15,
              ),
              Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      department["name"],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "${department['booksCount']} lectures",
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45),
                    ),
                  ],
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }

// book department skeleton
  Widget bookDepartmentSkeletons() => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
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
        height: 80,
        alignment: Alignment.centerLeft,
        child: const ListTile(
          leading: ShimmerWidget.circular(
            height: 64,
            width: 64,
            // shapeBorder:
            //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          title: ShimmerWidget.rectangular(height: 16),
          subtitle: ShimmerWidget.rectangular(
            height: 12,
          ),
        ),
      );
}
