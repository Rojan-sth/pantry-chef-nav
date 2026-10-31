import 'package:flutter/material.dart';

import '../models/recipe.dart';

/// Screen 3: walks through the steps one at a time. It closes with
/// true when the user taps Finish cooking, and with no value when the
/// user leaves early (close button or the phone's back gesture).
class CookingModeScreen extends StatefulWidget {
  const CookingModeScreen({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<CookingModeScreen> createState() => _CookingModeScreenState();
}

class _CookingModeScreenState extends State<CookingModeScreen> {
  int _index = 0;

  bool get _isLastStep => _index == widget.recipe.steps.length - 1;

  void _next() {
    if (_isLastStep) {
      Navigator.pop(context, true); // send "finished" back
    } else {
      setState(() => _index++);
    }
  }

  void _previous() => setState(() => _index--);

  @override
  Widget build(BuildContext context) {
    final steps = widget.recipe.steps;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cooking: ${widget.recipe.name}'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          tooltip: 'Leave cooking mode',
          onPressed: () => Navigator.pop(context), // no value sent back
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Step ${_index + 1} of ${steps.length}', style: text.titleMedium),
            const SizedBox(height: 8),
            LinearProgressIndicator(value: (_index + 1) / steps.length),
            const SizedBox(height: 32),
            Text(steps[_index], style: text.headlineSmall),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _index == 0 ? null : _previous,
                  child: const Text('Previous step'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  onPressed: _next,
                  child: Text(_isLastStep ? 'Finish cooking' : 'Next step'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
