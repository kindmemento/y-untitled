import 'package:flutter/material.dart';

enum AccountType { personal, team }

class AuthProvider extends ChangeNotifier {
  String? _token;
  String? _username;
  String? _firstName;
  String? _lastName;
  String? _email;
  AccountType? _accountType;
  bool _isLoggedIn = false;

  String? get token => _token;
  String? get username => _username;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  AccountType? get accountType => _accountType;
  bool get isLoggedIn => _isLoggedIn;

  void setUser({String? token, String? username, String? firstName, String? lastName, String? email, AccountType? accountType}) {
    _token = token;
    _username = username;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _accountType = accountType;
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _token = null;
    _username = null;
    _firstName = null;
    _lastName = null;
    _email = null;
    _accountType = null;
    _isLoggedIn = false;
    notifyListeners();
  }
}
