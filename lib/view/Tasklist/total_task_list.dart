import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ticketing_system/view/Tasklist/notification/total_task_controller.dart';

import 'package:ticketing_system/constants/icons.dart';
import 'package:ticketing_system/view/widgets/play_pause_button.dart';

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
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  task.status == 'TO_DO'
                                      ? todoIcon
                                      : task.status == 'IN_PROGRESS'
                                          ? inProgressIcon
                                          : completedIcon,
                                  width: 24,
                                ),
                                const SizedBox(width: 20),
                                const Icon(Icons.access_time),
                                const SizedBox(width: 10),
                                Text(
                                  '${task.totalWorkedInMin} mins',
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                          PlayPauseButton(
                            task: task,
                            index: index,
                          ),
                        ],
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
