import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:ticketing_system/models/login_model.dart';
import 'package:ticketing_system/models/task_modal.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ticketing_system/services/api_endpoints.dart';

class ApiService extends GetxService {
  final Dio _dio = Dio();

  String? authToken;
  final storage = const FlutterSecureStorage();
  int? id = -1;

  //authentication of user
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _dio.post(
        '${dotenv.env['baseUrl']}$loginEndpt',
        data: request.toJson(),
      );

      if (response.data['status'] == 1 &&
          response.data['message'] == 'Record found !!!') {
        final loginResponse = LoginResponse.fromJson(response.data);
        authToken = loginResponse.token;
        id = loginResponse.user.id;

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
    int userID = id!;
    print('user id $userID');
    print('token from secure storage $token');

    try {
      if (token != null) {
        final response = await _dio.get(
          '${dotenv.env['baseUrl']}$dashboardEndpt/$userID',
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

  /// fetching total task list
  Future<List<TotalTask>> fetchTotalTasks() async {
    print('inside the fetch total task method');
    int userID = id!;
    print('user id  😎😎 $userID ');
    final loginToken = await storage.read(key: 'loginToken');
    String? token = loginToken;
    try {
      if (token != null) {
        print('user id $userID');
        final response = await _dio.get(
          '${dotenv.env['baseUrl']}$dashboardEndpt/$userID',
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
        );
        print(response.data['status']);
        if (response.statusCode == 200) {
          final Map<String, dynamic> responseData = response.data;
          final int status = responseData['status'] ?? 0;
          final Map<String, dynamic>? data = responseData['data'];
          if (status == 1 && data != null) {
            final List<dynamic> totalTaskJsonList = data['totalTask'];
            List<TotalTask> totalTasks = totalTaskJsonList
                .map((taskJson) => TotalTask.fromJson(taskJson))
                .toList();
            return totalTasks;
          } else {
            throw Exception('Failed to load total tasks');
          }
        } else {
          throw Exception(
              'Failed to fetch data, status code: ${response.statusCode}');
        }
      } else {
        throw Exception('Token is null');
      }
    } catch (e) {
      print('error fetching total task: $e');
      return [];
    }
  }
}
