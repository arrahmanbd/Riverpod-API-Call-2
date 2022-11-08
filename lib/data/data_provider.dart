import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/doc_model.dart';
import '../models/todo_model.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';

final todoDataProvider = FutureProvider<List<TodoModel>>((ref) async {
  return ref.watch(todoProvider).getTodo();
});
final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});
final docDataProvider = FutureProvider<DocModel>((ref) async {
  return ref.watch(docProvider).getDoctors();
});
