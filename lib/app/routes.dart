import 'package:get/get.dart';
import 'package:ticketing_system/view/screens/home_screen.dart';
import 'package:ticketing_system/view/screens/login_view.dart';
import 'package:ticketing_system/view/screens/dashboard_screen.dart';

final routes = [
  GetPage(name: '/', page: () => LoginView()),
  GetPage(name: '/home', page: () => DashBoardScreen()),
  GetPage(
      name: '/homescreen',
      page: () => HomeScreen(
            loginResponse: Get.arguments, 
          ),), // Replace with your home view
];
