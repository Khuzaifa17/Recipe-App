import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spoonacular_app/provider/recipe_provider.dart';
import 'package:spoonacular_app/screens/home_Screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Spoonacular App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
