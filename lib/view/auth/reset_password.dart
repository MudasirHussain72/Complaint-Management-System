import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController resetPasswordController = TextEditingController();
  Future reset() async {
    try {
      FirebaseAuth.instance
          .sendPasswordResetEmail(email: resetPasswordController.text.trim())
          .then((value) => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("successfully sent"))));
    } on FirebaseException catch (e) {
      return AwesomeSnackbarContent(
        title: "exception",
        message: e.message.toString(),
        contentType: ContentType("message"),
      );
      //  SnackBar(content: Text(e.message.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 90.0, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Update\nPassword",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text:
                      "Dont't worry! it happens. Please enter the address associated with your account.",
                  style: const TextStyle(fontSize: 13, color: Colors.black),
                  children: [
                    TextSpan(
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, "/SignUpScreen");
                          }),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: resetPasswordController,
                decoration: InputDecoration(
                    hintText: "Email ID", fillColor: Color(0xff6D88E7)),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24),
            child: InkWell(
                onTap: () {
                  reset();
                },
                child: Container(
                  height: 56,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Center(
                      child: Text(
                    "Reset",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )),
                )),
          ),
        )
      ]),
    );
  }
}
