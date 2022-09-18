// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:meal_app/models/dummy_data.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/pages/favourite.dart';
import 'package:meal_app/pages/homepage.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Meal> favouriteM = [];
  @override
  void initState() {
    favouriteM = Favourite;
    super.initState();
  }

  final List<Map<String, Object>> _pages = [
    {
      "page": HomePage(),
      "Appbar": "Categories",
    },
    {
      "page": FavouritePage(),
      "Appbar": "Favourite",
    }
  ];
  int _selectedPage = 0;
  void selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_pages[_selectedPage]["Appbar"] as String),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 243, 192, 114),
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPage,
        onTap: selectPage,
        backgroundColor: Colors.pinkAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: "Favourite",
          )
        ],
      ),
      body: _pages[_selectedPage]['page'] as Widget,
    );
  }
}
