import 'package:flutter/material.dart';
import 'package:myapp/data/restaurant.dart';

class MenuPage extends StatelessWidget {
  static const routeName = '/menu_page';

  final Restaurant restaurant;
  const MenuPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Foods',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: restaurant.menus.foods.length,
                itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.restaurant),
                  title: Text(restaurant.menus.foods[index].name),
                ),
              ),
            ),
            const Text(
              'Drinks',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: restaurant.menus.drinks.length,
                itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.local_drink),
                  title: Text(restaurant.menus.drinks[index].name),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}