import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PlayPauseButton extends StatelessWidget {
  final controller = Get.put(PlayPauseController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.togglePlayPause();
      },
      child: Obx(() => Icon(
            controller.isPlaying.value ? Icons.pause : Icons.play_arrow,
            color: Colors.green.withOpacity(0.8),
            size: 50, // Adjust icon size as needed
          )),
    );
  }
}

class PlayPauseController extends GetxController {
  var isPlaying = false.obs;

  void togglePlayPause() {
    isPlaying.toggle();
  }
}
