import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ticketing_system/components/sizebox.dart';
import 'package:ticketing_system/constants/colors.dart';
import 'package:ticketing_system/constants/text_strings.dart';
import 'package:ticketing_system/controllers/daily_task_controller.dart';
import 'package:ticketing_system/view/components/daily_task_list.dart';

class HomeView extends StatelessWidget {
  // const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.25,
              child: Container(
                decoration: const BoxDecoration(
                  color: solidPink,
                ),
                child: const Center(
                  child: Text(dashBoard),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
