import 'package:dio/dio.dart';
import 'package:y_mobile/api/api_service.dart';
import 'package:y_mobile/utils/api_constants.dart';
import 'package:y_mobile/utils/auth_provider.dart';

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
