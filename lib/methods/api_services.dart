import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_api/model/modelArticles.dart';

class ApiService {
  Future<List<Article>> getArticle() async {
    final url = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=b1fbe8514eae41d99a79cd20cc01c93c";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      try {
        var body = json.decode(response.body);
        List<Article> _data = List<Article>.from(
            body['articles'].map((e) => Article.fromJson(e)).toList());
        //print("Decoded Response Body: $_data");
        return _data;
      } catch (e) {
        print("JSON Decoding Error: $e");
        return []; // Return an empty list or handle the error as needed
      }
    } else {
      print("API Error - Status Code: ${response.statusCode}");
      return [];
    }
  }
}


