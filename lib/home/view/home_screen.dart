import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:login/auth/controller/login_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: badges.Badge(
              position: badges.BadgePosition.topEnd(),
              badgeContent: Text('2'),
              child: Icon(
                Icons.notifications_none_outlined,
              ),
            ),
          ),
        ],
      ),
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
                ElevatedButton(
                  onPressed: () {},
                  child: Text('+'),
                ),
                ElevatedButton(
                    onPressed: () {
                      loginController.logout();
                    },
                    child: Text('LogOut'))
              ],
            ),
    );
  }
}
