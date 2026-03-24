import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CounterStore {
  final count = signal(0);

  void increment() {
    count.value = count.value + 1;
  }

  void decrement() {
    count.value = count.value - 1;
  }

  void reset() {
    count.value = 0;
  }

  Computed<int> get doubled => computed(() => count.value * 2);
}

final counterStore = CounterStore();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Point of Sales'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter:'),
            Watch((context) {
              return Text(
                '${counterStore.count.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
            const SizedBox(height: 16),
            Watch((context) {
              return Text('Doubled: ${counterStore.doubled.value}');
            }),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => counterStore.decrement(),
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => counterStore.increment(),
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => counterStore.reset(),
                  child: const Icon(Icons.refresh),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
