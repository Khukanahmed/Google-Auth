import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../screen/login_screen.dart';

class SignupController extends GetxController {
  var logger = Logger();
  final signUpFormKey = GlobalKey<FormState>();

  // TextEditingController for email and password
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Rx variables for validation status
  RxBool isValidEmail = true.obs;
  RxBool isValidPassword = true.obs;

  final isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUp(String email, String password) async {
    EasyLoading.show(status: 'Signing up...');
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.to(
        () => LoginScreen(),
      );
      Get.snackbar('Success', 'Account created successfully');
      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        logger.d("This email is already in use. Please try logging in.");
      }
      isLoading.value = false;
    } finally {
      EasyLoading.dismiss();
    }
  }

  // Email validator
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // Validate email format
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Password validator
  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password should be at least 6 characters long';
    }
    return null;
  }

  void onSubmit() {
    if (signUpFormKey.currentState?.validate() ?? false) {
      signUp(
        emailController.text,
        passwordController.text,
      );
    } else {}
  }
}
