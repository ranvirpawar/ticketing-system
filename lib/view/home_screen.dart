import 'package:flutter/material.dart';
import 'package:ticketing_system/constants/colors.dart';
import 'package:ticketing_system/constants/text_strings.dart';
import 'package:ticketing_system/models/login_model.dart';
import 'package:ticketing_system/view/Tasklist/daily_task.dart';
import 'package:ticketing_system/view/dashboard_screen.dart';
import 'package:ticketing_system/view/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  final LoginResponse loginResponse;

  const HomeScreen({Key? key, required this.loginResponse}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late final List<Widget> _screens = [
    DashBoardScreen(),
    Container(
      color: grape,
    ),
    TaskScreen(),
    Container(
      color: fadedPurple,
    ),
    ProfilePage(loginResponse: widget.loginResponse),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          title: Text(appName),
          centerTitle: true,
        ),
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task_rounded),
              label: 'Tickets',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.today_outlined),
              label: 'To Do',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_sharp),
              label: 'Bill',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
          ],
          selectedItemColor: orange,
          unselectedItemColor: blackRussian,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
