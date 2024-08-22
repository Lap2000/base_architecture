import 'dart:collection';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_sample/shared/constant/app_constant.dart';
import 'package:test_sample/shared/flavor/app_flavor.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  final testLKL = LinkedList<EntryItem>();

  int battery = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    MethodChannel channel = MethodChannel(AppConstant.channel);
    channel.invokeMethod("getBattery").then((result) {
      setState(() {
        battery = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final entries = [EntryItem(1, 'A'), EntryItem(2, 'B'), EntryItem(3, 'C')];
    testLKL.addAll(entries);
    final entry2 = entries.firstWhere((e) => e.id == 3).previous;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Battery: $battery%',
            ),
            Text(
              'Environment: ${Flavor.instance.flavor}',
            ),
            Text(
              'Selected Linked Item : $entry2',
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Go Home',
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

final class EntryItem extends LinkedListEntry<EntryItem> {
  final int id;
  final String text;
  EntryItem(this.id, this.text);

  @override
  String toString() {
    return '$id : $text';
  }
}
