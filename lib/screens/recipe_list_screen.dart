import 'package:flutter/material.dart';

import '../data/sample_recipes.dart';
import '../models/recipe.dart';
import 'recipe_detail_screen.dart';

/// Screen 1: the home screen and the bottom of the navigation stack.
class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  final Set<String> _cookedIds = {};

  Future<void> _openRecipe(Recipe recipe) async {
    // Pass data FORWARD: the selected recipe goes into the new screen.
    // Receive data BACK: the details screen pops with true when the
    // recipe was cooked, or with nothing (null) if the user just left.
    final cooked = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => RecipeDetailScreen(recipe: recipe)),
    );

    if (!mounted) return;

    if (cooked == true) {
      setState(() => _cookedIds.add(recipe.id));
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text('${recipe.name} marked as cooked.')),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('PantryChef')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Pick a recipe to get started',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          for (final recipe in sampleRecipes)
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: colors.primaryContainer,
                  child: Text(recipe.name[0]),
                ),
                title: Text(recipe.name),
                subtitle: Text(
                  '${recipe.minutes} min, serves ${recipe.servings}',
                ),
                trailing: _cookedIds.contains(recipe.id)
                    ? Icon(Icons.check_circle, color: colors.primary)
                    : const Icon(Icons.chevron_right),
                onTap: () => _openRecipe(recipe),
              ),
            ),
        ],
      ),
    );
  }
}
