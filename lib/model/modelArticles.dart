import 'package:news_api/model/modelSource.dart';

class Article {
  Source source;
  String urlToImage;
  String author;
  String title;
  String description;
  String publishedAt;

  Article(
      {required this.source,
      required this.urlToImage,
      required this.author,
      required this.title,
      required this.description,
      required this.publishedAt});

  factory Article.fromJson(Map<String, dynamic> json) {
    //print('parsed data : ${Article}');
    return Article(
        source: Source.fromJson(json['source']),
    urlToImage: json['urlToImage'] != null ? json['urlToImage'].toString() : '',
    author: json['author'] ?? '', // Provide a default value for nullable fields
    title: json['title'] ?? '',
    description: json['description'] ?? '',
    publishedAt: json['publishedAt'] ?? '',);
  }
}
