import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:ticketing_system/models/daily_task_model.dart';
import '../models/login_model.dart';
import 'package:dio/dio.dart';

class ApiService extends GetxService {
  final Dio _dio = Dio();
  String? _authToken;

///// Login    ////////
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      // in post api heating we need to send the req body
      final response = await _dio.post(
        '${dotenv.env['baseUrl']}/login',
        data: request.toJson(),
      );
      if (response.data['status'] == 1 &&
          response.data['message'] == 'Record found !!!') {
        _authToken = response.data['token'];
        print('💖💖💖💖$_authToken');
        print(response.data.toString() + '✌️✌️ yah login');
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

  Future<List<DailyTaskModel>> fetchDailyTasks() async {
    try {
      final response = await _dio.get(
        '${dotenv.env['baseUrl']}/dashboard/463',
        options: Options(
          headers: {
            'Autherization': 'Bearer $_authToken',
          },
        ),
      );
      print(response.data);

      if (response.data['status'] == 1 &&
          response.data['message'] == 'Record found') {
        final dailyTasks = (response.data['data']['dailyTask'] as List)
            .map((task) => DailyTaskModel.fromJson(task))
            .toList();
        return dailyTasks;
      } else {
        throw Exception('Failed to fetch daily tasks');
      }
    } on DioException catch (e) {
      throw Exception('Error fetching daily tasks: $e');
    }
  }
}
