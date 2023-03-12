import 'dart:convert';

import 'package:flutter/material.dart';

@immutable
class User {
  final String name;
  final int age;
  final bool valid;
  const User({
    required this.name,
    required this.age,
    required this.valid,
  });

  User copyWith({
    String? name,
    int? age,
    bool? valid,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
      valid: valid ?? this.valid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'valid': valid,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      age: map['age']?.toInt() ?? 0,
      valid: map['valid'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(name: $name, age: $age, valid: $valid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.name == name &&
      other.age == age &&
      other.valid == valid;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode ^ valid.hashCode;
}
