import 'package:complaint_management_app/view/auth/login/login.dart';
import 'package:complaint_management_app/view/auth/signup/signup.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "F",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.blue,
                      fontSize: 120),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Welcome to Finance",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 26,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Manage all of your finance accounts\nin one place",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 56,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const Center(
                            child: Text(
                          "Log In",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                    )),
                const SizedBox(height: 20),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 56,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const Center(
                            child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                    )),
              ]),
        ),
      ),
    );
  }
}
