import 'package:flutter/material.dart';
import 'package:umar_media/widgets/common-widgets/shimmer-widgets.dart';

class BookListSkeleton extends StatelessWidget {
  const BookListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Color.fromRGBO(3, 25, 59, 1),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(3, 25, 59, 1),
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
}
