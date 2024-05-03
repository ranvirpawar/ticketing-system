import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticketing_system/components/sizebox.dart';
import 'package:ticketing_system/constants/colors.dart';

class ProfileFieldWidget extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  const ProfileFieldWidget({
    super.key,
    // required this.user,
    required this.label,
    required this.value,
    required this.icon,
  });

  // final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          border: Border.all(color: fadedPurple.withOpacity(0.2), width: 1),
          boxShadow: [
            BoxShadow(
              color: fadedPurple.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(8),
          color: fadedPurple.withOpacity(0.2)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 22,
            ),
            const WidthSizedBox(
              width: 8,
            ),
            Text('$label :',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            const WidthSizedBox(width: 8),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const HeightSizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
