import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spoonacular_app/model/recipe.dart';


class ApiService {
  static const String apiKey = '6e53b2347ffa407d9107625d4916f61a';
  static const String baseUrl = 'https://api.spoonacular.com/recipes/complexSearch';

  Future<List<Recipe>> searchRecipes(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl?query=$query&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final List results = json.decode(response.body)['results'];
      return results.map((json) => Recipe.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
