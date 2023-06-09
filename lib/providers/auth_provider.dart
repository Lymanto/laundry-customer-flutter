import 'package:customer/models/user_model.dart';
import 'package:customer/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;
  UserModel get user => _user;
  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> login(String noHP) async {
    try {
      UserModel user = await AuthService().login(noHP: noHP);
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
