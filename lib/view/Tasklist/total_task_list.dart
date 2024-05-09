import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ticketing_system/constants/icons.dart';
import 'package:ticketing_system/models/task_modal.dart';
import 'package:ticketing_system/services/api_service.dart';
import 'package:ticketing_system/view/Tasklist/daily_task_controller.dart';

class TotalTaskController extends GetxController {
  final ApiService _apiService = ApiService();
  final tasks = <TotalTask>[].obs;

  @override
  void onInit() {
    fetchTasks();
    super.onInit();
  }

  void fetchTasks() async {
    try {
      final fetchedTasks = await _apiService.fetchTotalTasks();
      tasks.assignAll(fetchedTasks);
    } catch (e) {
      print('Error fetching tasks: $e');
    }
  }
}

class TotalTaskListScreen extends StatelessWidget {
  final taskController = Get.put(TotalTaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total Tasks'),
      ),
      body: Obx(
        () => taskController.tasks.isNotEmpty
            ? ListView.builder(
                itemCount: taskController.tasks.length,
                itemBuilder: (context, index) {
                  final task = taskController.tasks[index];
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                        radius: 14,
                      ),
                      title: Text(
                        task.taskName,
                        style: TextStyle(),
                      ),
                      subtitle: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Image.asset(
                              task.status == 'TO_DO'
                                  ? todoIcon
                                  : task.status == 'IN_PROGRESS'
                                      ? inProgressIcon
                                      : completedIcon,
                              width: 20,
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.play_arrow,
                                color: Colors.green.withOpacity(0.8)),
                            SizedBox(width: 8),
                            Text(
                              task.timeStatus,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.access_time),
                            SizedBox(width: 8),
                            Text(
                              '${task.totalWorkedInMin} mins',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
