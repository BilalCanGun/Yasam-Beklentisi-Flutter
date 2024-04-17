import 'package:flutter/material.dart';
import 'package:yasam/input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.lightBlue,
        appBarTheme: AppBarTheme(backgroundColor: Colors.lightBlue[300]),
      ),
      home: InputPage(),
    );
  }
}
