import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:ticketing_system/app/routes.dart';
import 'package:ticketing_system/utils/theme.dart';

import 'package:ticketing_system/view/login_view.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
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
