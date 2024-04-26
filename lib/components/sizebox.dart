import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class HeightSizedBox extends StatelessWidget {
  const HeightSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}

class WidthSizedBox extends StatelessWidget {
  const WidthSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 10,
    );
  }
}
