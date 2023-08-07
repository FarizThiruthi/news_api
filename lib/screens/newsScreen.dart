import 'package:flutter/material.dart';

import '../model/modelArticles.dart';

class NewsDetailScreen extends StatelessWidget {
  final Article article;

  NewsDetailScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(article.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            if (article.urlToImage != null && article.urlToImage.isNotEmpty)
              Image.network(article.urlToImage),
            SizedBox(height: 20),
            Text(article.description),
            Spacer(), // Pushes the card to the bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text('Published at: ${article.publishedAt}'),
                      SizedBox(height: 20),
                      Text('Author: ${article.author}'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
