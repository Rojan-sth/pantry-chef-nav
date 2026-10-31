import 'package:flutter/material.dart';

import '../models/recipe.dart';
import 'cooking_mode_screen.dart';

/// Screen 2: shows the recipe it RECEIVED from the list screen.
class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({super.key, required this.recipe});

  final Recipe recipe;

  Future<void> _startCooking(BuildContext context) async {
    // The result is null when the user leaves Cooking Mode early.
    final finished = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => CookingModeScreen(recipe: recipe)),
    );

    if (!context.mounted) return;

    if (finished == true) {
      // Send the result one more step back, to the list screen.
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cooking paused. Tap Start cooking to begin again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(recipe.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(recipe.name, style: text.headlineSmall),
          const SizedBox(height: 4),
          Text(
            '${recipe.minutes} min, serves ${recipe.servings}, '
            '${recipe.steps.length} steps',
          ),
          const SizedBox(height: 20),
          Text('Ingredients', style: text.titleMedium),
          const SizedBox(height: 8),
          for (final item in recipe.ingredients)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.circle, size: 8),
                  const SizedBox(width: 10),
                  Expanded(child: Text(item)),
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton.icon(
            onPressed: () => _startCooking(context),
            icon: const Icon(Icons.play_arrow),
            label: const Text('Start cooking'),
          ),
        ),
      ),
    );
  }
}
