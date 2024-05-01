import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticketing_system/components/sizebox.dart';
import 'package:ticketing_system/constants/colors.dart';
import 'package:ticketing_system/models/login_model.dart';
import 'package:ticketing_system/models/user_model.dart';
import 'package:ticketing_system/view/components/profile_field_widget.dart';

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
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileFieldWidget(
                label: 'Name',
                value:
                    '${user.firstName} ${user.middleName ?? ''} ${user.lastName}',
                icon: Icons.person,
              ),

              ProfileFieldWidget(
                label: 'Email',
                value: user.emailId,
                icon: Icons.email,
              ),
              // Text(
              //     'Name: ${user.firstName} ${user.middleName ?? ''} ${user.lastName}'),
              // Text('Email: ${user.emailId}'),
              // Text('Contact No: ${user.contactNo}'),
              // Text('Whatsapp No: ${user.whatsAppContactNo}'),
              // Text('Role: ${user.roleName}'),
              // Text('Department: ${user.departmentName}'),
              // Text('Designation: ${user.designation}'),
              // Add more fields as needed
            ],
          ),
        ),
      ),
    );
  }
}
