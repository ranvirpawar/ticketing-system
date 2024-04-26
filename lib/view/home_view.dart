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
  final DailyTaskController dailyTaskController =
      Get.put(DailyTaskController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
        centerTitle: true,
      ),
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
            const HeightSizedBox(),
            const Row(children: [Icon(Icons.grid_4x4_outlined)]),
            const Divider(),
            const HeightSizedBox(),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       SizedBox(
            //         width: screenWidth * 0.70,
            //         height: screenHeight * 0.4,
            //         child: Container(
            //           color: lightBeige,
            //           child: SingleChildScrollView(
            //             child: Column(
            //               children: [
            //                 Text('Daily Tasks'),
            //                 Expanded(
            //                   child: DailyTaskListView(),
            //                 ),
            //               ],
            //               // show the list of Daily tasks
            //             ),
            //           ),
            //         ),
            //       ),
            //       const WidthSizedBox(),
            //       SizedBox(
            //         width: screenWidth * 0.70,
            //         height: screenHeight * 0.4,
            //         child: Container(
            //           color: lightBeige,
            //           child: const Column(),
            //         ),
            //       ),
            //       const WidthSizedBox(),
            //       SizedBox(
            //         width: screenWidth * 0.70,
            //         height: screenHeight * 0.4,
            //         child: Container(
            //           color: lightBeige,
            //           child: const Column(),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            SingleChildScrollView(
              child: SizedBox(
                height: screenHeight * 0.4,
                child: Column(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
