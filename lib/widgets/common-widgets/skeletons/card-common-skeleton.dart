import 'package:flutter/material.dart';
import 'package:ttp_app/widgets/common-widgets/shimmer-widgets.dart';

class CardCommonSkeleton extends StatelessWidget {
  const CardCommonSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
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
}
