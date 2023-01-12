import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var fullNameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  Future SignUp() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try {
      // create user
      await _auth
          .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then((value) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .set({
          "fullName": fullNameController.text.trim(),
          "email": emailController.text.trim(),
          "phone": int.parse(phoneController.text.trim()),
          "isAdmin": false
        });
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("account created successfully")));
      });
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
      if (kDebugMode) {
        print(e);
      }
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: Text(e.message.toString()),
            );
          });
    }
    await Navigator.pushNamed(context, "/LoginScreen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.grey),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Create new account",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 26,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade300),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: "Phone Number",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade300),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "E-mail or phone number",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade300),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade300),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          SignUp();
                        }
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
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
