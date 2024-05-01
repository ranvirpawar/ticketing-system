import 'package:flutter/material.dart';
import 'package:ticketing_system/constants/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required TextEditingController emailController,
    this.lableText,
    this.icon,
  }) : _emailController = emailController;

  final TextEditingController _emailController;
  final String? lableText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: lableText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        prefixIcon: Icon(
          icon,
          color: orange,
        ),
      ),
      validator: (value) {
        // Validate email
      },
    );
  }
}
