import 'package:complaint_management_app/view/admin_view/admin_main_screen.dart';
import 'package:complaint_management_app/view/auth/login/login.dart';
import 'package:complaint_management_app/view/auth/signup/signup.dart';
import 'package:complaint_management_app/view/user_view/user_account_sreen.dart';
import 'package:complaint_management_app/view/user_view/user_main_screen.dart';
import 'package:complaint_management_app/view/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CMS",
      initialRoute: "/",
      routes: {
        "/": (context) => const WelcomeScreen(),
        "/LoginScreen": (context) => const LoginScreen(),
        "/SignUpScreen": (context) => const SignUpScreen(),
        "/AdminMainScreen": (context) => const AdminMainScreen(),
        "/UserMainScreen": (context) => const UserMainScreen(),
        "/AccountScreen": (context) => const AccountScreen(),
      },
    );
  }
}
