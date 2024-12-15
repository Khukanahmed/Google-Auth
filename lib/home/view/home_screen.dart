import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:login/auth/controller/login_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loginController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('Welcome'),
                ),
                Container()
              ],
            ),
    );
  }
}
