import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import '../widget/text_field_widget.dart';
import 'sign_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text(
            'Login',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Form(
            key: loginController.formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: loginController.emailController,
                  hintText: 'Email',
                  validator: loginController.emailValidator,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                CustomTextField(
                  controller: loginController.passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  validator: loginController.passwordValidator,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                ElevatedButton(
                  onPressed: () {
                    loginController.onSubmit();
                  },
                  child: Text('Enter'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  'or',
                  style: TextStyle(
                      fontSize: 16,
                      color: const Color(0xffFF8B2D),
                      fontWeight: FontWeight.bold),
                ),
                Center(
                  child: SizedBox(
                    height: 58,
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        backgroundColor: const Color(0xffDFF8EC),
                      ),
                      onPressed: () {
                        loginController.signInWithGoogle();
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/google.png',
                            height: 24,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Continue with google",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(
                        SignupScreen(),
                      );
                    },
                    child: Text('I have no account'))
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
