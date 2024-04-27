import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String label;
  const EmptyState({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      heightFactor: screenHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.filter_none_sharp,
            size: 70,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(label,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.red)),
        ],
      ),
    );
  }
}
