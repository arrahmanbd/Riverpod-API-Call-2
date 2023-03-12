import 'dart:convert';

class CounterModel {
  final int count;

  CounterModel(
    this.count,
  );



  CounterModel copyWith({
    int? count,
  }) {
    return CounterModel(
      count ?? this.count,
    );
  }
}
