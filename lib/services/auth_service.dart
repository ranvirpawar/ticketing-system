import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import '../models/login_model.dart';
import 'package:dio/dio.dart';

class AuthService extends GetxService {
  final Dio _dio = Dio();

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _dio.post(
        '${dotenv.env['baseUrl']}/login',
        data: request.toJson(),
      );
      if (response.data['status'] == 1 &&
          response.data['message'] == 'Record found !!!') {
        return LoginResponse.fromJson(response.data);
      } else {
        throw Exception('Login failed: ${response.data['message']}');
      }
    } on DioException catch (e) {
      // Handle Dio exceptions
      if (e.response?.statusCode == 404) {
        throw Exception('Login endpoint not found');
      } else {
        rethrow;
      }
    }
  }
}
