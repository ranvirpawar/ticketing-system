import 'package:get/get.dart';
import '../models/daily_task_model.dart';
import '../services/api_service.dart';

class DailyTaskController extends GetxController {
  final ApiService _apiService = ApiService();
  final _dailyTasks = <DailyTaskModel>[].obs;

  List<DailyTaskModel> get dailyTasks => _dailyTasks;

  @override
  void onInit() {
    super.onInit();
    fetchDailyTasks();
  }

  Future<void> fetchDailyTasks() async {
    try {
      final tasks = await _apiService.fetchDailyTasks();
      _dailyTasks.assignAll(tasks);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}