import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myapp/data/article.dart';
import 'package:myapp/pages/detailpage.dart';

List<Article> parseArticles(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => Article.fromJson(json)).toList();
}

Widget buildArticleItem(BuildContext context, Article article) {
  return ListTile(
    onTap: () {
      Navigator.pushNamed(context, DetailPage.routeName, arguments: article);
    },
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    leading: Image.network(
      article.urlToImage,
      width: 100,
      errorBuilder: (ctx, error, _) => const Center(child: Icon(Icons.error)),
    ),
    title: Text(article.title),
    subtitle: Text(article.author),
  );
}
