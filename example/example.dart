import 'package:flutter/material.dart';
import 'package:shimmer_container_flutter/src/shimmer_container_widget.dart';

void main() {
  runApp(const MyApp());
}

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ShimmerContainer(
            width: 200,
            height: 50,
            colorOne: Colors.grey[300],
            colorTwo: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
            duration: const Duration(milliseconds: 800),
          ),
        ),
      ),
    );
  }
}
