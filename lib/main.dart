import 'package:flutter/material.dart';

import 'screens/recipe_list_screen.dart';

void main() => runApp(const PantryChefApp());

/// Root of the app. The Navigator that MaterialApp creates holds the
/// stack of screens: Recipe List -> Recipe Details -> Cooking Mode.
class PantryChefApp extends StatelessWidget {
  const PantryChefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PantryChef',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4E6B3A)),
        useMaterial3: true,
      ),
      home: const RecipeListScreen(),
    );
  }
}
