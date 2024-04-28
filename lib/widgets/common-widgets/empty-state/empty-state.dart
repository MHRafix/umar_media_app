import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String label;
  final String tagline;
  const EmptyState({super.key, required this.label, required this.tagline});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      heightFactor: screenHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/others.png',
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
          // const Icon(
          //   Icons.filter_none_sharp,
          //   size: 70,
          //   color: Colors.grey,
          // ),
          const SizedBox(
            height: 5,
          ),

          Text(label,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          Text(tagline,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey)),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              maximumSize: const Size(150, 100),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                // Adjust the radius as needed
              ),
              // Adjust the size as per your requirement
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Go Back',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
