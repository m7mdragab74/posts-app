import 'package:flutter/material.dart';

class postsDataModel extends ChangeNotifier {
  String name = '';
  String email = '';
  String phoneNumber = '0';
  String password = '';
  String image = '';

  nameNotifier() {
    notifyListeners();
  }

  emailNotifier() {
    notifyListeners();
  }

  phone() {
    notifyListeners();
  }

  passwordNotifier() {
    notifyListeners();
  }

  imageNotifier() {
    notifyListeners();
  }
}
