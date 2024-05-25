import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:umar_media/screens/books/components/book-departments/book-department-card.dart';
import 'package:umar_media/screens/home/views/controll_screen.dart';
import 'package:umar_media/widgets/common-widgets/empty-state/empty-state.dart';
import 'package:umar_media/widgets/common-widgets/skeletons/card-common-skeleton.dart';
// import 'package:ttp_app/screens/books/components/book-departments/book-department-card.dart';
// import 'package:ttp_app/widgets/common-widgets/empty-state/empty-state.dart';
// import 'package:ttp_app/widgets/common-widgets/skeletons/card-common-skeleton.dart';

class BooksScreen extends StatelessWidget {
  BooksScreen({super.key});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

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
        backgroundColor: Color(0x121544),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ControlScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            //replace with our own icon data.
          ),
          // automaticallyImplyLeading: true,
          title: const Text(
            "Book Departments",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),

          titleSpacing: 00.0,
          toolbarHeight: 60.2,
          toolbarOpacity: 1,
          elevation: 0.00,
          backgroundColor: Color.fromRGBO(3, 25, 59, 1),
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
                      return const CardCommonSkeleton();
                    })
                : RefreshIndicator(
                    triggerMode: RefreshIndicatorTriggerMode.onEdge,
                    edgeOffset: 20,
                    displacement: 40,
                    key: _refreshIndicatorKey,
                    color: Color.fromRGBO(119, 110, 249, 1),
                    backgroundColor: Color.fromARGB(255, 5, 9, 63),
                    strokeWidth: 3.0,
                    onRefresh: () async {
                      // print("refreshed...");
                      refetch!();
                      return Future<void>.delayed(const Duration(seconds: 3));
                    },
                    child: data['nodes']?.length == 0 && !result.isLoading
                        ? const EmptyState(
                            label: "I am empty :(",
                            tagline: "You have no department",
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(10),
                            itemCount: data?["nodes"].length,
                            itemBuilder: (BuildContext context, int index) {
                              return BookDepartmentCard(
                                  department: data?["nodes"][index]);
                            }));
            // }
          },
        ));
  }
}
