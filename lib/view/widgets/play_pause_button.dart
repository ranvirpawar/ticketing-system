import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_system/models/task_modal.dart';
import 'package:ticketing_system/view/Tasklist/notification/total_task_controller.dart';

class PlayPauseButton extends StatelessWidget {
  final TotalTask task;
  final int index;

  PlayPauseButton({required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TotalTaskController>();
    return GetBuilder<TotalTaskController>(
      builder: (controller) {
        return IconButton(
          icon: Icon(
            task.isPlaying ? Icons.pause : Icons.play_arrow,
            color: task.isPlaying ? Colors.red : Colors.green,
          ),
          onPressed: () {
            controller.showNotification(task, !task.isPlaying, index);
          },
        );
      },
    );
  }
}
