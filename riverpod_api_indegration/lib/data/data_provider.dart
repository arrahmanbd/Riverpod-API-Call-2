import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/doc_model.dart';
import '../models/todo_model.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';

final todoDataProvider = FutureProvider<List<TodoModel>>((ref) async {
  return ref.watch(apiProvider).getTodo();
});
final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(apiProvider).getUsers();
});
final docDataProvider = FutureProvider<DocModel>((ref) async {
  return ref.watch(apiProvider).getDoctors();
});
