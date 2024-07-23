import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spoonacular_app/provider/recipe_provider.dart';
import 'package:spoonacular_app/screens/Favourite_Screen.dart';

import 'recipe_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    final searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Spoonacular Recipes'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search Recipes',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    recipeProvider.searchRecipes(searchController.text);
                  },
                ),
              ),
            ),
            Expanded(
              child: Consumer<RecipeProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                    itemCount: provider.recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = provider.recipes[index];
                      final isFavorite = provider.favorites.contains(recipe);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(30)),
                          child: ListTile(
                            // leading: Image.network(recipe.image),
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(recipe.image),
                            ),
                            title: Text(recipe.title),
                            trailing: IconButton(
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite ? Colors.red : null,
                              ),
                              onPressed: () {
                                provider.toggleFavorite(recipe);
                              },
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RecipeDetailScreen(recipe: recipe),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                      //
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
