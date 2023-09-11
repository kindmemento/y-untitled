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

  void setToken(String value) {
    _token = value;
    notifyListeners();
  }

  void setUserDetails({String? token, String? username, String? firstName, String? lastName, String? email, AccountType? accountType}) {
    _token = token;
    _username = username;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _accountType = accountType;
    notifyListeners();
  }

  void setAccountType(String type) {
    if (type == 'personal') {
      _accountType = AccountType.personal;
    } else if (type == 'team') {
      _accountType = AccountType.team;
    } else {
      throw ArgumentError("Invalid account type provided");
    }
    notifyListeners();
  }

  void setLoggedIn(bool value) {
    _isLoggedIn = value;
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
