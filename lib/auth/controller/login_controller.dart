import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../home/view/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../screen/login_screen.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String? fcmToken;

  RxBool isValidEmail = true.obs;
  RxBool isValidPassword = true.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _saveLoginState(true);
    _initializeFCM();
  }

// Initialize Firebase Cloud Messaging
  void _initializeFCM() async {
    // Request permission for iOS
    await _firebaseMessaging.requestPermission();

    // Get the FCM token for push notifications
    fcmToken = await _firebaseMessaging.getToken();

    print(
        "..................FCM Token: $fcmToken"); // You can use this token to send notifications from your server

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Received message: ${message.notification?.title}");
      // You can show notifications here using a local package like `flutter_local_notifications`
    });
  }

  // Background message handler (for when app is closed)
  static Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
    print("Background message: ${message.notification?.title}");
    // Handle background push notification
  }

  Future<void> _saveLoginState(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  // Method to check login state
  Future<bool> checkLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ??
        false; // Returns false if no value exists
  }

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        _saveLoginState(true);

        Get.offAll(() => HomeScreen());
      }
    } catch (e) {
      print("object........................");
    } finally {
      isLoading.value = false;
    }
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
    isLoading.value = true;
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
    } catch (error) {
      print(".................Google Sign-In Error: $error");
    } finally {
      isLoading.value = false;
    }
  }

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

  void onSubmit() async {
    if (formKey.currentState?.validate() ?? false) {
      await login(emailController.text, passwordController.text);
      // Get.to(() => HomeScreen());
    } else {}
    //Get.to(() => HomeScreen());
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false); // Clear login state
    await auth.signOut();
    Get.offAll(() => LoginScreen()); // Navigate back to LoginScreen
  }
}
