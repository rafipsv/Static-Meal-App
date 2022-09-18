// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_function_literals_in_foreach_calls, unused_local_variable

import 'package:flutter/material.dart';
import 'package:meal_app/models/dummy_data.dart';
import 'package:meal_app/pages/meal_items.dart';

class RecipeScreen extends StatelessWidget {
  final String title;
  final String id;
  const RecipeScreen({required this.title, required this.id});
  @override
  Widget build(BuildContext context) {
    final meals = DUMMYMEALS.where(
      (element) {
        return element.categories.contains(id);
      },
    ).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          title,
        ),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return MealItems(
            id:  meals[index].id,
            title: meals[index].title,
            imageUrl: meals[index].imageUrl,
            duration: meals[index].duration,
            complexity: meals[index].complexity,
            affordability: meals[index].affordability,
          );
        }),
        itemCount: meals.length,
      ),
    );
  }
}
