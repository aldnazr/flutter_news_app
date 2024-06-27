import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myapp/data/restaurant.dart';
import 'package:myapp/pages/detailpage.dart';

List<Restaurant> parseRestaurants(String? json) {
  if (json == null) {
    return [];
  }

  final Map<String, dynamic> decodedData = jsonDecode(json);
  final List<dynamic> restaurants = decodedData['restaurants'];
  return restaurants.map((json) => Restaurant.fromJson(json)).toList();
}

Widget buildRestaurantItem(BuildContext context, Restaurant restaurant) {
  return ListTile(
    onTap: () {
      Navigator.pushNamed(context, DetailPage.routeName, arguments: restaurant);
    },
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    leading: Image.network(
      restaurant.pictureId,
      width: 100,
      errorBuilder: (ctx, error, _) => const Center(child: Icon(Icons.error)),
    ),
    title: Text(restaurant.name),
    subtitle: Text(restaurant.city),
  );
}
