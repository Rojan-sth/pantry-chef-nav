import '../models/recipe.dart';

const List<Recipe> sampleRecipes = [
  Recipe(
    id: 'pasta',
    name: 'Garlic Butter Pasta',
    minutes: 20,
    servings: 2,
    ingredients: [
      '200 g spaghetti',
      '3 tbsp butter',
      '4 garlic cloves, minced',
      'Handful of parsley, chopped',
      'Salt and pepper',
    ],
    steps: [
      'Boil a large pot of salted water and cook the spaghetti until tender.',
      'While the pasta cooks, melt the butter in a pan over low heat.',
      'Add the garlic and stir for about one minute until fragrant.',
      'Drain the pasta and toss it in the garlic butter.',
      'Top with parsley, salt, and pepper, then serve.',
    ],
  ),
  Recipe(
    id: 'omelette',
    name: 'Veggie Omelette',
    minutes: 10,
    servings: 1,
    ingredients: [
      '2 eggs',
      '1/4 cup chopped bell pepper',
      '2 tbsp chopped onion',
      '1 tsp oil',
      'Pinch of salt',
    ],
    steps: [
      'Whisk the eggs with a pinch of salt.',
      'Heat the oil in a pan and soften the pepper and onion.',
      'Pour in the eggs and let them set around the edges.',
      'Fold the omelette in half and slide it onto a plate.',
    ],
  ),
  Recipe(
    id: 'rice',
    name: 'Fried Rice',
    minutes: 15,
    servings: 2,
    ingredients: [
      '2 cups cooked rice',
      '1 cup mixed vegetables',
      '2 eggs',
      '2 tbsp soy sauce',
      '1 tbsp oil',
    ],
    steps: [
      'Heat the oil in a wok or large pan.',
      'Stir fry the vegetables for two minutes.',
      'Push them aside, scramble the eggs, then mix everything together.',
      'Add the rice and soy sauce and stir fry until hot.',
    ],
  ),
  Recipe(
    id: 'salad',
    name: 'Chickpea Salad',
    minutes: 10,
    servings: 2,
    ingredients: [
      '1 can chickpeas, drained',
      '1 cucumber, diced',
      '1 tomato, diced',
      '2 tbsp olive oil',
      '1 tbsp lemon juice',
    ],
    steps: [
      'Add the chickpeas, cucumber, and tomato to a bowl.',
      'Whisk the olive oil and lemon juice together.',
      'Pour the dressing over the salad and toss well.',
    ],
  ),
];
