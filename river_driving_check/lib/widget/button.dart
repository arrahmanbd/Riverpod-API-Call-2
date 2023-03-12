import 'package:flutter/material.dart';
class BTN extends StatelessWidget {
  const BTN({
    Key? key,
    required this.fun,
    required this.color,
    required this.text,
  }) : super(key: key);
  final VoidCallback fun;
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: TextButton(
        child: Text(text,
            style: TextStyle(
              color: Colors.white,
            )),
        onPressed: () {},
      ),
    );
  }
}