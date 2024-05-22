import 'package:get/get.dart';
import 'package:ticketing_system/models/task_modal.dart';
import 'package:ticketing_system/services/api_service.dart';

class TaskController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  final dailyTasks = RxList<dynamic>([]);
  @override
  void onInit() {
    super.onInit();
    fetchDailyTasks();
    print('called the FetchDailyTask on init method');
    
  }

  Future<void> fetchDailyTasks() async {
    print('inside the task controller');
    try {
      final dailyTasks = await _apiService.fetchDailyTasks();
      dailyTasks.assignAll(dailyTasks);
      for (var task in dailyTasks) {
        print(task);
      }
    } catch (e) {
      print('Error fetching daily tasks: $e');
    }
  }

  List<dynamic> get dailyTasks1 => dailyTasks;
  void printDailyTasks() {
    print('Daily Tasks: $dailyTasks');
    for (var task in dailyTasks) {
      print(task);
    }
  }
}
