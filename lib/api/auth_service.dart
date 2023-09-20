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

      String? username0 = decodedToken['username'];
      String? firstName = decodedToken['first_name'];
      String? lastName = decodedToken['last_name'];
      String? email0 = decodedToken['email'];
      String? accountTypeString = decodedToken['account_type'];

      AccountType? accountType;
      if (accountTypeString == 'personal') {
        accountType = AccountType.personal;
      } else if (accountTypeString == 'team') {
        accountType = AccountType.team;
      }

      _authProvider.setToken(_token!);
      _authProvider.setUserDetails(
          username: username0, firstName: firstName, lastName: lastName, email: email0, accountType: accountType);
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
