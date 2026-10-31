# PantryChef Navigation Lab

ITS-537 Week 9 lab: multi-screen navigation in Flutter using stack-based
navigation (Navigator.push and Navigator.pop).

## Screens
1. Recipe List (home)
2. Recipe Details (receives the selected Recipe)
3. Cooking Mode (step by step, returns true when finished)

## Data flow
- Forward: the Recipe object is passed through each screen's constructor.
- Back: Cooking Mode pops with true, Recipe Details passes true back to the
  list, and the list marks the recipe as cooked and shows a SnackBar.

## Run
    flutter pub get
    flutter run
    flutter test
