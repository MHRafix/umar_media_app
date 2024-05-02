import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ttp_app/screens/books/components/book-lists/book-card.dart';
import 'package:ttp_app/screens/books/components/book-lists/books-skeleton.dart';
import 'package:ttp_app/widgets/common-widgets/empty-state/empty-state.dart';

class BookListScreen extends StatelessWidget {
  final String id;
  final String name;
  BookListScreen({super.key, required this.id, required this.name});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    // book list query
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
            icon: const Icon(Icons.arrow_back),
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
                      return const BookListSkeleton();
                    })
                : RefreshIndicator(
                    triggerMode: RefreshIndicatorTriggerMode.onEdge,
                    edgeOffset: 20,
                    displacement: 40,
                    key: _refreshIndicatorKey,
                    color: Colors.orange,
                    backgroundColor: Colors.black,
                    strokeWidth: 3.0,
                    onRefresh: () async {
                      // refetch query after refresh
                      refetch!();
                      return Future<void>.delayed(const Duration(seconds: 3));
                    },
                    child: data['nodes']?.length == 0 && !result.isLoading
                        ? const EmptyState(
                            label: "I am empty :(",
                            tagline: "You have no books")
                        : ListView.builder(
                            clipBehavior: Clip.hardEdge,
                            padding: const EdgeInsets.all(
                                5.0), // padding around the grid
                            itemCount:
                                data?["nodes"].length, // total number of items
                            itemBuilder: (context, index) {
                              return BookCard(book: data?["nodes"][index]);
                            },
                          ));
          },
        ));
  }
}
