import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:ticketing_system/models/login_model.dart';
import 'package:ticketing_system/models/task_modal.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService extends GetxService {
  final Dio _dio = Dio();

  String? authToken;
  final storage = const FlutterSecureStorage();

  //authentication of user
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _dio.post(
        '${dotenv.env['baseUrl']}/login',
        data: request.toJson(),
      );

      if (response.data['status'] == 1 &&
          response.data['message'] == 'Record found !!!') {
        final loginResponse = LoginResponse.fromJson(response.data);
        authToken = loginResponse.token;

        await storage.write(key: 'loginToken', value: '$authToken');

        print('inside login method $authToken ');

        return loginResponse;
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

  Future<List<dynamic>> fetchDailyTasks() async {
    final loginToken = await storage.read(key: 'loginToken');
    String? token = loginToken;
    print('token from secure storage $token');

    try {
      if (token != null) {
        final response = await _dio.get(
          '${dotenv.env['baseUrl']}/dashboard/463',
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
        );

        print(response.data['status']);
        print(response.data['message']);

        if (response.statusCode == 200) {
          final taskResponse = TasksResponse.fromJson(response.data);
          print(taskResponse.data.dailyTask);
          return taskResponse.data.dailyTask;
        } else {
          print(" exception occurred");
          throw Exception(
              'Failed to fetch daily task: ${response.data['message']}');
        }
      } else {
        throw Exception('Authentication token is not available');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
