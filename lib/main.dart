import 'package:flutter/material.dart';
import 'package:library_app/pages/book_details_page.dart';
import 'package:library_app/pages/home_page.dart';
import 'package:library_app/pages/shelves_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
