import 'package:flutter/material.dart';
import 'package:myapp/data/restaurant.dart';
import 'package:myapp/pages/detailpage.dart';
import 'package:myapp/pages/menupage.dart';
import 'package:myapp/pages/restaurantpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RestaurantPage.routeName,
      routes: {
        RestaurantPage.routeName: (context) => const RestaurantPage(),
        DetailPage.routeName: (context) => DetailPage(
            restaurant:
                ModalRoute.of(context)?.settings.arguments as Restaurant),
        MenuPage.routeName: (context) => MenuPage(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
      },
    );
  }
}
