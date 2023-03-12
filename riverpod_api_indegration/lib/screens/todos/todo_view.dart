import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/screens/doclist/doclist.dart';
import '../../data/data_provider.dart';
import '../../models/todo_model.dart';
import '../users/user_view.dart';
import 'details.dart';

class ViewTodo extends ConsumerWidget {
  const ViewTodo({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(todoDataProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('River API Calls'),
          actions: [
            IconButton(
                onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    ),
                icon: const Icon(Icons.add)),
            IconButton(
                onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ViewDoc()),
                    ),
                icon: const Icon(Icons.adjust_rounded))
          ],
        ),
        body: _data.when(
          data: (_data) {
            List<TodoModel> todoList = _data.map((e) => e).toList();
            return Column(
              children: [
                Expanded(child: ListView.builder(itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Details(
                          e: todoList[index],
                        ),
                      ),
                    ),
                    child: ListTile(
                      title: Text(todoList[index].title.toString()),
                    ),
                  );
                }))
              ],
            );
          },
          error: (err, s) => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
        ));
  }
}
