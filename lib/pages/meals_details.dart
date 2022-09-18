// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, unnecessary_string_interpolations, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/models/dummy_data.dart';

class MealsDetails extends StatefulWidget {
  final String id;
  MealsDetails({required this.id});

  @override
  State<MealsDetails> createState() => _MealsDetailsState();
}

class _MealsDetailsState extends State<MealsDetails> {
  @override
  Widget build(BuildContext context) {
    final selectedMeals = DUMMYMEALS.firstWhere(
      (element) {
        return element.id.contains(widget.id);
      },
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 248, 74, 132),
        onPressed: (() {
          Favourite.add(selectedMeals);
          Navigator.pop(context);
        }),
        child: Icon(
          Icons.star,
          size: 30,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text(selectedMeals.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(
                selectedMeals.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ingredients",
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 180,
              width: 270,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: ListView.builder(
                itemBuilder: ((context, index) {
                  return Card(
                    color: Colors.orangeAccent,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 4, bottom: 4),
                      child: Text("${selectedMeals.ingredients[index]}",
                          style: GoogleFonts.raleway(fontSize: 18)),
                    ),
                  );
                }),
                itemCount: selectedMeals.ingredients.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Steps",
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 200,
              width: 270,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: ListView.builder(
                itemBuilder: ((context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 233, 46, 108),
                      foregroundColor: Color.fromARGB(255, 233, 46, 108),
                      child: Text(
                        "#${index + 1}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      selectedMeals.steps[index],
                      style: GoogleFonts.raleway(fontWeight: FontWeight.w600),
                    ),
                  );
                }),
                itemCount: selectedMeals.steps.length,
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
