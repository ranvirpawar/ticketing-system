import 'package:get/get.dart';
import 'package:ticketing_system/view/login_view.dart';
import 'package:ticketing_system/view/home_view.dart';

final routes = [
  GetPage(name: '/', page: () => LoginView()),
  GetPage(name: '/home', page: () => HomeView()), // Replace with your home view
];
