import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/view_models/user_view_model.dart';

import '../widget/button.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(uservmProvider);
    // final beable = ref.watch(uservmProvider.notifier).isValid;
    return Scaffold(
      appBar: AppBar(
          title: const Text('Hey, User'),
          centerTitle: true,
          actions: [const Icon(Icons.add)]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              // TextFormField(
              //   decoration: const InputDecoration(labelText: 'Email'),
              //   onChanged: (value) {},
              // ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Age'),
                onChanged: (value) {
                  ref
                      .read(uservmProvider.notifier)
                      .updateAge(int.parse(value));
                },
              ),
              const SizedBox(height: 20),
              Container(
                height: 120,
                width: 120,
                color: user.valid ? Colors.green : Colors.red,
              ),
              const SizedBox(height: 30.0),
              Expanded(
                  child: Column(
                children: [
                  Text(user.age.toString()),
                  const SizedBox(height: 20.0),
                  Text(user.name)
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
