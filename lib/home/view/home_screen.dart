import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/CURD/view/curd_view.dart';
import 'package:login/chat/view/chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Get.to(
              ChatScreen(),
            );
          },
          child: Text("Chat"),
        ),
        ElevatedButton(
          onPressed: () {
            Get.to(
              CurdView(),
            );
          },
          child: Text("CURD"),
        )
      ],
    );
  }
}
