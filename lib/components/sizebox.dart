import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class HeightSizedBox extends StatelessWidget {
  final double? height;
  const HeightSizedBox({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 20,
    );
  }
}

class WidthSizedBox extends StatelessWidget {
  final double? width;
  const WidthSizedBox({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 20,
    );
  }
}
