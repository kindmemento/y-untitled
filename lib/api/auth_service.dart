import 'package:dio/dio.dart';
import 'package:y_mobile/api/api_service.dart';
import 'package:y_mobile/utils/api_constants.dart';
import 'package:y_mobile/utils/auth_provider.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthService {
  final ApiService _apiService = ApiService();
  final Dio _dio = Dio();
  final AuthProvider _authProvider;

  AuthService(this._authProvider);

  String? _token;

  Future<void> login(String? username, String? email, String password) async {
    try {
      final requestData = {if (username != null) "username": username, if (email != null) "email": email, "password": password};

      final response = await _apiService.post(ApiConstants.loginUrl, data: requestData);
      _token = response.data['token'];

      Map<String, dynamic> decodedToken = JwtDecoder.decode(_token!);

      String? _username = decodedToken['username'];
      String? _firstName = decodedToken['first_name'];
      String? _lastName = decodedToken['last_name'];
      String? _email = decodedToken['email'];
      String? accountTypeString = decodedToken['account_type'];

      AccountType? _accountType;
      if (accountTypeString == 'personal') {
        _accountType = AccountType.personal;
      } else if (accountTypeString == 'team') {
        _accountType = AccountType.team;
      }

      _authProvider.setToken(_token!);
      _authProvider.setUserDetails(
          username: _username, firstName: _firstName, lastName: _lastName, email: _email, accountType: _accountType);
      _authProvider.setLoggedIn(true);
    } catch (e) {
      throw ApiException.from(e);
    }
  }

  void setAuthToken() {
    if (_token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $_token';
    }
  }
}
