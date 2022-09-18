// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:meal_app/models/dummy_data.dart';
import 'package:meal_app/pages/category_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
          padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0),
          children: dummyCatagories.map((data) {
            return CategoryItem(
              title: data.title,
              color: data.color,
              id: data.id,
            );
          }).toList()),
    );
  }
}
