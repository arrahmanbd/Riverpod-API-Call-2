import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/counter_view_model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Counter'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, watch, child) {
            final numb = watch.watch(CounterProvider).count.toString();
            return Text(numb);
          },
        ),
      ),
      floatingActionButton: Consumer(builder: (context, watch, child) {
        final fun = watch.read(CounterProvider.notifier);
        return FloatingActionButton(
          onPressed: () {
            fun.increment();
          },
          child: const Icon(Icons.add),
        );
      }),
    );
  }
}
