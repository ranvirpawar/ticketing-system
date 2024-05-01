import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_system/controllers/daily_task_controller.dart';

class DailyTaskListView extends StatelessWidget {
  final DailyTaskController controller = Get.put(DailyTaskController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: controller.dailyTasks.length,
        itemBuilder: (context, index) {
          final task = controller.dailyTasks[index];
          return ListTile(
            title: Text(task.taskName),
            subtitle: Text(task.priority),
            trailing: Text(task.status),
          );
        },
      ),
    );
  }
}
