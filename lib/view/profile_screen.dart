import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:ticketing_system/models/login_model.dart';

import 'package:ticketing_system/view/widgets/profile_field_widget.dart';

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
        padding: const EdgeInsets.all(16.0),
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
              ProfileFieldWidget(
                label: 'Contact No',
                value: user.contactNo,
                icon: Icons.phone,
              ),
              ProfileFieldWidget(
                label: "Role",
                value: "${user.roleName}",
                icon: Icons.work,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
