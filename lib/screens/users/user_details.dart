// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:riverpod_api/models/user_model.dart';

class Details extends StatelessWidget {
  final UserModel e;
  const Details({
    Key? key,
    required this.e,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(e.email.toString()),
      ),
    );
  }
}
