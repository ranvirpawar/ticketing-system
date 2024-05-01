import 'package:get/get.dart';
import 'package:ticketing_system/view/home_screen.dart';
import 'package:ticketing_system/view/login_view.dart';
import 'package:ticketing_system/view/home_view.dart';

final routes = [
  GetPage(name: '/', page: () => LoginView()),
  GetPage(name: '/home', page: () => HomeView()),
  GetPage(
      name: '/homescreen',
      page: () => HomeScreen(
            loginResponse: Get.arguments,
          )), // Replace with your home view
];
