import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spoonacular_app/provider/recipe_provider.dart';
import 'package:spoonacular_app/screens/recipe_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: recipeProvider.favorites.length,
        itemBuilder: (context, index) {
          final recipe = recipeProvider.favorites[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(30)),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(recipe.image),
                ),
                title: Text(recipe.title),
                trailing: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    recipeProvider.toggleFavorite(recipe);
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeDetailScreen(recipe: recipe),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
