import 'package:flutter_test/flutter_test.dart';

import 'package:pantry_chef_nav/main.dart';

void main() {
  testWidgets('finishing a recipe sends the result back to the list',
      (tester) async {
    await tester.pumpWidget(const PantryChefApp());

    await tester.tap(find.text('Garlic Butter Pasta'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Start cooking'));
    await tester.pumpAndSettle();

    while (find.text('Finish cooking').evaluate().isEmpty) {
      await tester.tap(find.text('Next step'));
      await tester.pumpAndSettle();
    }
    await tester.tap(find.text('Finish cooking'));
    await tester.pumpAndSettle();

    expect(find.text('Pick a recipe to get started'), findsOneWidget);
    expect(find.text('Garlic Butter Pasta marked as cooked.'), findsOneWidget);
  });

  testWidgets('leaving cooking mode early returns to the recipe details',
      (tester) async {
    await tester.pumpWidget(const PantryChefApp());

    await tester.tap(find.text('Garlic Butter Pasta'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Start cooking'));
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Leave cooking mode'));
    await tester.pumpAndSettle();

    expect(find.text('Start cooking'), findsOneWidget);
  });
}
