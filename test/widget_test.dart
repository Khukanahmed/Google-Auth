import 'package:flutter_test/flutter_test.dart';
import 'package:login/auth/screen/login_screen.dart';
import 'package:login/home/view/home_screen.dart';

import 'package:login/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Provide a default value for isLoggedIn in the test.
    bool isLoggedIn = false; // or true based on your desired test behavior

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(isLoggedIn: isLoggedIn));

    // Verify that the app is showing the LoginScreen when not logged in.
    expect(find.byType(LoginScreen), findsOneWidget);
    expect(find.byType(HomeScreen), findsNothing);

    // You can simulate user interaction, for example, login and then check for HomeScreen.
    // (Additional logic could be added based on your test needs)
  });
}
