// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/pages/meals_details.dart';

class MealItems extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  const MealItems({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });
  void seletMeal(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MealsDetails(id: id);
        },
      ),
    );
  }

  String checkComplixity() {
    String work;
    if (complexity == Complexity.Simple) {
      work = "Simple";
      return work;
    } else if (complexity == Complexity.Hard) {
      work = "Hard";
      return work;
    } else {
      work = "Challenging";
      return work;
    }
  }

  String checkAffordibility() {
    String price;
    if (affordability == Affordability.Affordable) {
      price = "Affordable";
      return price;
    } else if (affordability == Affordability.Pricey) {
      price = "Pricey";
      return price;
    } else {
      price = "Luxurius";
      return price;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => seletMeal(context),
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              15,
            ),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      child: FadeInImage(
                        image: NetworkImage(
                          imageUrl,
                        ),
                        placeholder: AssetImage(
                          "assets/images/loading.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 250,
                      color: Colors.black54,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "$duration min",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.work),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${checkComplixity()}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${checkAffordibility()}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
