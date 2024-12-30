import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/auth/controller/login_controller.dart';
import 'package:login/firebase_options.dart';
import 'auth/screen/login_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'home/view/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  LoginController loginController = Get.put(LoginController());

  bool isLoggedIn = await loginController.checkLoginState();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isLoggedIn ? HomeScreen() : LoginScreen(),
      builder: EasyLoading.init(),
    );
  }
}
