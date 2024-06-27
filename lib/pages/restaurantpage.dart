import 'package:flutter/material.dart';
import 'package:myapp/data/restaurant.dart';
import 'package:myapp/utils/utils.dart';

class RestaurantPage extends StatelessWidget {
  static const routeName = '/restaurant';

  const RestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant'),
      ),
      body: FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurant = parseRestaurants(snapshot.data);
          return ListView.builder(
            itemCount: restaurant.length,
            itemBuilder: (context, index) {
              return buildRestaurantItem(context, restaurant[index]);
            },
          );
        },
      ),
    );
  }
}
