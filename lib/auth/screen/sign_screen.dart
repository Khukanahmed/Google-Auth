import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/signup_controller.dart';
import '../widget/text_field_widget.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(
              'Signup',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 24,
            ),
            Form(
              key: signupController.signUpFormKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: signupController.emailController,
                    hintText: 'Email',
                    validator: signupController.emailValidator,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: signupController.passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    validator: signupController.passwordValidator,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .04,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      signupController.onSubmit();
                    },
                    child: Text('Sign Up'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
