import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:ticketing_system/app/routes.dart';
import 'package:ticketing_system/services/api_service.dart';
import 'package:ticketing_system/utils/theme.dart';
import 'package:ticketing_system/view/Tasklist/total_task_list.dart';

import 'package:ticketing_system/view/screens/login_view.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  Get.put(ApiService());
  AwesomeNotifications().initialize(
    'resource://drawable/res_app_icon',
    [
      NotificationChannel(
        channelKey: 'task_channel',
        channelName: 'Task Channel',
        channelDescription: 'Notifications for task management',
        defaultColor: Colors.blue,
        ledColor: Colors.white,
      ),
    ],
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ticketing System',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      getPages: routes,
      home: LoginView(),
    );
  }
}
