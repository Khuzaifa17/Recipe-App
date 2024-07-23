import 'package:flutter/material.dart';
import 'package:spoonacular_app/model/recipe.dart';
import 'package:spoonacular_app/services/api_service.dart';



class RecipeProvider with ChangeNotifier {
  List<Recipe> _recipes = [];
  List<Recipe> _favorites = [];

  List<Recipe> get recipes => _recipes;
  List<Recipe> get favorites => _favorites;

  Future<void> searchRecipes(String query) async {
    _recipes = await ApiService().searchRecipes(query);
    notifyListeners();
  }

  void toggleFavorite(Recipe recipe) {
    if (_favorites.contains(recipe)) {
      _favorites.remove(recipe);
    } else {
      _favorites.add(recipe);
    }
    notifyListeners();
  }
}
