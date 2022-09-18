// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/models/dummy_data.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/pages/favourite_items.dart';

class FavouritePage extends StatefulWidget {
  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  late List<Meal> favouriteItems;
  @override
  void initState() {
    favouriteItems = Favourite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favouriteItems.isEmpty
          ? Center(
              child: Text(
                "No favourite Recipe Available",
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemBuilder: ((context, index) {
                return InkWell(
                  onLongPress: () {
                    Favourite.removeAt(index);
                    setState(() {});
                  },
                  child: FavouriteMealItems(
                    id: favouriteItems[index].id,
                    title: favouriteItems[index].title,
                    imageUrl: favouriteItems[index].imageUrl,
                    duration: favouriteItems[index].duration,
                    complexity: favouriteItems[index].complexity,
                    affordability: favouriteItems[index].affordability,
                  ),
                );
              }),
              itemCount: favouriteItems.length,
            ),
    );
  }
}
