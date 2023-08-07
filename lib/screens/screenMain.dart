import 'package:flutter/material.dart';
import 'package:news_api/methods/api_services.dart';
import 'package:news_api/model/modelArticles.dart';

import 'newsScreen.dart';

class NewsAPI extends StatelessWidget {
  const NewsAPI({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService client = ApiService();
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: FutureBuilder<List<Article>>(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final article = snapshot.data![index];

                return Card(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailScreen(article: article),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        if (article.urlToImage != null && article.urlToImage.isNotEmpty)
                          Image.network(article.urlToImage),
                        if (article.title != null) // Check if title is not null
                          Text(article.title),
                      ],
                    ),
                  ),
                );
              },
            );

          }
        },
      ),
    );
  }
}

