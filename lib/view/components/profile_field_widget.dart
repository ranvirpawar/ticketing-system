import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticketing_system/components/sizebox.dart';

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
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20,
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
            child: Text(value, style: const TextStyle(fontSize: 18)),
          ),
          const HeightSizedBox(height: 10),
        ],
      ),
    );
  }
}
