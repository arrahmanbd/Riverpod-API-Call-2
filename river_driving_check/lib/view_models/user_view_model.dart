import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super._state);
  bool isValid = false;

  //Validation
  void check(String name, int age) {
    if (name.isNotEmpty && age > 18) {
      isValid = true;
      //Update Only Name
      void updateName(String name) {
        state = state.copyWith(name: name);
      }

      //Update age
      void updateAge(int age) {
        state = state.copyWith(age: age);
      }
    } else {
      isValid = false;
    }
  }

  //Update age
  void updateAge(int age) {
    if (age > 18) {
      state = state.copyWith(age: age, valid: true);
    } else {
      state = state.copyWith(valid: false);
    }
  }
  //Update Everything
  // void updateUser(String name, age) {
  //   state = User(name: name, age: age);
  // }
}

final uservmProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier(const User(name: '', age: 0, valid: false));
});
