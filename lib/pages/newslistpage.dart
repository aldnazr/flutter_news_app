import 'package:flutter/material.dart';
import 'package:myapp/data/article.dart';
import 'package:myapp/utils/utils.dart';

class NewsListPage extends StatelessWidget {
  static const routeName = '/article_list';

  const NewsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString('assets/articles.json'),
        builder: (context, snapshot) {
          final List<Article> articles = parseArticles(snapshot.data);
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return buildArticleItem(context, articles[index]);
            },
          );
        },
      ),
    );
  }
}
