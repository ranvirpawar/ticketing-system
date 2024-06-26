import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:ticketing_system/view/Tasklist/controller/total_task_controller.dart';

class NotificationController {
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // method to do something when a notification is created
  }

  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // method to do something when a notification is displayed
  }

  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // method to do something when a notification is dismissed
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
        break;
    }
  }
}
