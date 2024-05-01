import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticketing_system/models/login_model.dart';

class ProfilePage extends StatefulWidget {
  final LoginResponse loginResponse;

  const ProfilePage({Key? key, required this.loginResponse}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = widget.loginResponse.user;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Name: ${user.firstName} ${user.middleName ?? ''} ${user.lastName}'),
            Text('Email: ${user.emailId}'),
            Text('Contact No: ${user.contactNo}'),
            Text('Whatsapp No: ${user.whatsAppContactNo}'),
            Text('Role: ${user.roleName}'),
            Text('Department: ${user.departmentName}'),
            Text('Designation: ${user.designation}'),
            // Add more fields as needed
          ],
        ),
      ),
    );
  }
}
