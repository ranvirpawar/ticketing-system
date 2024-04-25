import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_system/constants/colors.dart';
import 'package:ticketing_system/services/auth_service.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginController =
        Get.put(LoginController(authService: AuthService()));

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => loginController.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: _emailController,
                            
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: orange,
                              ),
                            ),
                            validator: (value) {
                              // Validate email
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: orange,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: orange,
                              ),
                            ),
                            validator: (value) {
                              // Validate password
                            },
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  loginController.login(
                                    _emailController.text,
                                    _passwordController.text,
                                  );
                                }
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
