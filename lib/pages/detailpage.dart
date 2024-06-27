import 'package:flutter/material.dart';
import 'package:myapp/data/restaurant.dart';
import 'package:myapp/pages/menupage.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail_page';

  final Restaurant restaurant;
  const DetailPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                restaurant.pictureId,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'City: ${restaurant.city}',
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Rating: ${restaurant.rating}',
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Description:',
                      ),
                      Text(restaurant.description),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            Navigator.pushNamed(context, MenuPage.routeName,
                                arguments: restaurant);
                          },
                          child: const Text('Menu'),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
