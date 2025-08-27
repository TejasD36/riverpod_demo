import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//region Riverpod Example to change state
///State Provider (Unlike simple provider the state can be changed for this provider)
final counter = StateProvider<int>((ref) {
  return 0;
});

final switchValue = StateProvider<bool>((ref) {
  return false;
});

///State Provider for Stateless Widget
/*class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///Make sure to use Consumer to avoid entire Widget rebuild
            Consumer(
              builder: (context, ref, child) {
                final count = ref.watch(counter);
                return Text(count.toString(), style: TextStyle(fontSize: 40));
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final switchVal = ref.watch(switchValue);
                return Switch(
                  value: switchVal,
                  onChanged: (value) {
                    ref.read(switchValue.notifier).state = value;
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counter.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}*/

///State Provider for Statefull Widget

class CounterScreen extends ConsumerStatefulWidget {
  const CounterScreen({super.key});

  @override
  ConsumerState<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends ConsumerState<CounterScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(switchValue.notifier).state = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///Make sure to use Consumer to avoid entire Widget rebuild
            Consumer(
              builder: (context, ref, child) {
                final count = ref.watch(counter);
                return Text(count.toString(), style: TextStyle(fontSize: 40));
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final switchVal = ref.watch(switchValue);
                return Switch(
                  value: switchVal,
                  onChanged: (value) {
                    ref.read(switchValue.notifier).state = value;
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counter.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

//endregion Riverpod Example to change state
