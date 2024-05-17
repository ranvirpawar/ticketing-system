import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_system/models/task_modal.dart';
import 'package:ticketing_system/view/Tasklist/notification/total_task_controller.dart';

class NotificationController {
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Do something when a new notification or a schedule is created
  }

  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Do something when a notification is displayed
  }

  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Do something when the user dismisses a notification
  }

  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    final controller = Get.find<TotalTaskController>();

    // Retrieve the task index from the notification payload
    final taskIndex = int.parse(receivedAction.payload!['taskIndex']!);

    switch (receivedAction.buttonKeyPressed) {
      case 'PLAY_Task':
        controller.handlePlayTaskAction(taskIndex);
        break;
      case 'PAUSE_Task':
        controller.handlePauseTaskAction(taskIndex);
        break;
      case 'NEXT_TASK':
        controller.handleNextTaskAction(taskIndex);
        break;
      case 'PREVIOUS_TASK':
        controller.handlePreviousTaskAction(taskIndex);
        break;
      default:
        // Handle other actions if needed
        break;
    }
  }
}
