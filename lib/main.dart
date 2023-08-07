import 'package:flutter/material.dart';
import 'package:news_api/screens/screenMain.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewsAPI(),
    );
  }
}
