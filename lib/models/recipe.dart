/// A single recipe. This object is passed forward from the list
/// screen to the details screen, and from details to Cooking Mode.
class Recipe {
  const Recipe({
    required this.id,
    required this.name,
    required this.minutes,
    required this.servings,
    required this.ingredients,
    required this.steps,
  });

  final String id;
  final String name;
  final int minutes;
  final int servings;
  final List<String> ingredients;
  final List<String> steps;
}
