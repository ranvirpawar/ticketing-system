import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_system/services/api_service.dart';
import 'package:ticketing_system/view/Tasklist/daily_task_controller.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late TaskController _taskController;

  @override
  void initState() {
    super.initState();
    Get.put(ApiService()); // Register the ApiService with GetX
    _taskController = Get.put(TaskController());
    _taskController
        .fetchDailyTasks(); // Call fetchDailyTasks when the screen is loaded
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: Obx(
        () {
          final dailyTasks = _taskController.dailyTasks;
          if (dailyTasks.isEmpty) {
            return Center(
              child: Text('No daily tasks'),
            );
          }
          return ListView.builder(
            itemCount: dailyTasks.length,
            itemBuilder: (context, index) {
              final task = dailyTasks[index];
              return ListTile(
                title: Text(task.taskName),
                subtitle: Text('${task.startDate} - ${task.scheduledDate}'),
              );
            },
          );
        },
      ),
    );
  }
}
