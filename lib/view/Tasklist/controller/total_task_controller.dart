import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_system/constants/icons.dart';
import 'package:ticketing_system/models/task_modal.dart';
import 'package:ticketing_system/services/api_service.dart';
import 'notification_controller.dart';

class TotalTaskController extends GetxController {
  final ApiService _apiService = ApiService();
  final tasks = <TotalTask>[].obs;
  int? currentTaskIndex;

  @override
  void onInit() {
    fetchTasks();
    super.onInit();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: 'task_channel_group',
          channelKey: 'task_channel',
          channelName: 'Task Channel',
          channelDescription: 'Notifications for task management',
          defaultColor: Colors.blue,
          ledColor: Colors.white,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          onlyAlertOnce: true,
          locked: true,
          defaultPrivacy: NotificationPrivacy.Public,
        ),
      ],
    );
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
    );
  }

  void fetchTasks() async {
    try {
      final fetchedTasks = await _apiService.fetchTotalTasks();
      tasks.assignAll(fetchedTasks);
    } catch (e) {
      print('Error fetching tasks: $e');
    }
  }

  void showMediaNotification(TotalTask task, bool isPlaying, int index) {
    currentTaskIndex = index;
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'task_channel',
        title: isPlaying ? 'Task Playing' : 'Task Paused',
        body: task.taskName,
        notificationLayout: NotificationLayout.MediaPlayer,
        bigPicture: techneAiLogo,
        payload: {
          'taskIndex': index.toString(),
        },
        autoDismissible: false,
        locked: true,
        category: NotificationCategory.Service,
        displayOnBackground: true,
        displayOnForeground: true,
        backgroundColor: Colors.black,
        color: Colors.white,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'PREVIOUS_TASK',
          label: 'Previous',
          autoDismissible: false,
          actionType: ActionType.KeepOnTop,
          icon: 'resource://drawable/ic_previous', // Specify your icon here
          enabled: index > 0,
          color: Colors.white,
        ),
        NotificationActionButton(
          key: isPlaying ? 'PAUSE_Task' : 'PLAY_Task',
          label: isPlaying ? 'Pause' : 'Play',
          autoDismissible: false,
          actionType: ActionType.KeepOnTop,
          icon: isPlaying
              ? 'resource://drawable/ic_pause'
              : 'resource://drawable/ic_play',
          color: Colors.white,
        ),
        NotificationActionButton(
          key: 'NEXT_TASK',
          label: 'Next',
          autoDismissible: false,
          actionType: ActionType.KeepOnTop,
          color: Colors.white,

          icon: 'resource://drawable/ic_next', // Specify your icon here
          enabled: index < tasks.length - 1,
        ),
      ],
    );
  }

  void handlePlayTaskAction(int taskIndex) {
    tasks[taskIndex].isPlaying = true; // Update task status
    currentTaskIndex = taskIndex;
    update(['task_list']);
    showMediaNotification(tasks[currentTaskIndex!], true, currentTaskIndex!);
  }

  void handlePauseTaskAction(int taskIndex) {
    tasks[taskIndex].isPlaying = false; // Update task status
    currentTaskIndex = taskIndex;
    update(['task_list']);
    showMediaNotification(tasks[currentTaskIndex!], false, currentTaskIndex!);
  }

  void handleNextTaskAction(int taskIndex) {
    if (taskIndex < tasks.length - 1) {
      final nextTask = tasks[taskIndex + 1];
      nextTask.isPlaying = true; // Start playing the next task
      tasks[taskIndex].isPlaying = false; // Stop playing the current task
      currentTaskIndex = taskIndex + 1;
      update(['task_list']);
      showMediaNotification(nextTask, true, currentTaskIndex!);
    }
  }

  void handlePreviousTaskAction(int taskIndex) {
    if (taskIndex > 0) {
      final previousTask = tasks[taskIndex - 1];
      previousTask.isPlaying = true; // Start playing the previous task
      tasks[taskIndex].isPlaying = false; // Stop playing the current task
      currentTaskIndex = taskIndex - 1;
      update(['task_list']);
      showMediaNotification(previousTask, true, currentTaskIndex!);
    }
  }
}
