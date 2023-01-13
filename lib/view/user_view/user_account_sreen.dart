import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complaint_management_app/view/auth/login/login.dart';
import 'package:complaint_management_app/view/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  var name;
  var email;
  var phone;
  var isAdmin;
  var address;

  Future<void> getuserData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((event) {
      // you can access the values by
      name = event['fullName'];
      email = event['email'];
      phone = event['phone'];
      isAdmin = event['isAdmin'];
      address = event['address'];
    });
    setState(() {});
  }

  var _textFieldController = TextEditingController();
  Future<void> _displayTextInputDialog(BuildContext context, String a) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Edit section'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: "edit"),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () async {
                    var collection =
                        FirebaseFirestore.instance.collection('users');
                    collection
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .update({
                      a: _textFieldController.text.trim().toString()
                    }) // <-- Updated data
                        .then((_) {
                      Navigator.pop(context);
                      getuserData();
                      // setState(() {});
                    }).catchError((error) => print('Failed: $error'));
                  },
                  child: const Text("edit"))
            ],
          );
        });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getuserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Profile",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 183, 221, 251),
                  radius: 46,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 45,
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.blue.shade300, width: 2),
                          boxShadow: const [
                            BoxShadow(
                              blurStyle: BlurStyle.outer,
                              color: Colors.grey,
                              blurRadius: 2.0,
                              spreadRadius: 0.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(50),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX25634104.jpg"))),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  name.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "User",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  child: Column(children: [
                    ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.blue.shade100,
                          child: Icon(
                            Icons.person,
                            color: Colors.blue,
                          )),
                      title: Text(
                        name.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          _displayTextInputDialog(context, "fullName");
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.blue.shade100,
                          child: Icon(
                            Icons.phone,
                            color: Colors.blue,
                          )),
                      title: Text(
                        phone.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          _displayTextInputDialog(context, "phone");
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.blue.shade100,
                          child: Icon(
                            Icons.alternate_email_rounded,
                            color: Colors.blue,
                          )),
                      title: Text(
                        email.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      // trailing: Icon(
                      //   Icons.edit,
                      //   size: 20,
                      //   color: Colors.blue,
                      // ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.blue.shade100,
                          child: Icon(
                            Icons.house_rounded,
                            color: Colors.blue,
                          )),
                      title: Text(
                        address.toString() == ""
                            ? "Please enter your address"
                            : address.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          _displayTextInputDialog(context, "address");
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, left: 18),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: InkWell(
                          onTap: () async {
                            await FirebaseAuth.instance.signOut().then(
                                (value) =>
                                    Navigator.of(context, rootNavigator: true)
                                        .pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return const WelcomeScreen();
                                        },
                                      ),
                                      (_) => false,
                                    ));
                          },
                          child: Container(
                            height: 45,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.blue.shade100),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.logout_outlined,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 2),
                                Text(
                                  "Sign Out",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
                )
              ]),
        ),
      ),
    );
  }
}
