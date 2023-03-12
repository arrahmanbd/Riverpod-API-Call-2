import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../models/doc_model.dart';
import '../models/todo_model.dart';
import '../models/user_model.dart';

class ApiServices {
  String url = 'https://jsonplaceholder.typicode.com/todos';
  String endpoint = 'https://reqres.in/api/users?page=2';
  String docurl = 'https://safihealth.org/api/speciality-wise-doctor';

  Future<List<TodoModel>> getTodo() async {
    Response response = await get(Uri.parse('$url'));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => TodoModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<DocModel> getDoctors() async {
    Response response = await get(Uri.parse('$docurl/2'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return DocModel.fromJson(data);
    } else {
      throw Exception('Failed to load');
    }
  }
}

final apiProvider = Provider<ApiServices>((ref) => ApiServices());
