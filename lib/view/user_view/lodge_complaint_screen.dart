import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  final categoryItems = [
    'Technical',
    'Non Technical',
  ];
  String? category;
  final items = [
    'Technical',
    'Non Technical',
  ];
  String? value;
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontSize: 20),
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 80),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Complaint",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 26,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        value: category,
                        hint: Text("Category"),
                        isExpanded: true,
                        icon: FaIcon(FontAwesomeIcons.chevronDown),
                        items: categoryItems.map(buildMenuItem).toList(),
                        onChanged: (value) => setState(
                              () => this.category = value,
                            )),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        value: value,
                        hint: Text("Time"),
                        isExpanded: true,
                        icon: FaIcon(FontAwesomeIcons.chevronDown),
                        items: items.map(buildMenuItem).toList(),
                        onChanged: (value) => setState(
                              () => this.value = value,
                            )),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        value: value,
                        hint: Text("Client"),
                        isExpanded: true,
                        icon: FaIcon(FontAwesomeIcons.chevronDown),
                        items: items.map(buildMenuItem).toList(),
                        onChanged: (value) => setState(
                              () => this.value = value,
                            )),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        value: value,
                        hint: Text("Complaint Type"),
                        isExpanded: true,
                        icon: FaIcon(FontAwesomeIcons.chevronDown),
                        items: items.map(buildMenuItem).toList(),
                        onChanged: (value) => setState(
                              () => this.value = value,
                            )),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        value: value,
                        hint: Text("Mode"),
                        isExpanded: true,
                        icon: FaIcon(FontAwesomeIcons.chevronDown),
                        items: items.map(buildMenuItem).toList(),
                        onChanged: (value) => setState(
                              () => this.value = value,
                            )),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        value: value,
                        hint: Text("Details"),
                        isExpanded: true,
                        icon: FaIcon(FontAwesomeIcons.chevronDown),
                        items: items.map(buildMenuItem).toList(),
                        onChanged: (value) => setState(
                              () => this.value = value,
                            )),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: InkWell(
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
                )
              ]),
        ),
      )),
    );
  }
}
