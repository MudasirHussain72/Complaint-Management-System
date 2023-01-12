import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResolvedCompScreen extends StatefulWidget {
  const ResolvedCompScreen({super.key});

  @override
  State<ResolvedCompScreen> createState() => _ResolvedCompScreenState();
}

class _ResolvedCompScreenState extends State<ResolvedCompScreen> {
  final items = [
    'item 1',
    'item 2',
    'item 3',
    'item 4',
  ];
  String? value;
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontSize: 10),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Resolved",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 26,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey, width: 2)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            value: value,
                            hint: Text("Date"),
                            // isExpanded: true,
                            icon: FaIcon(FontAwesomeIcons.chevronDown),
                            items: items.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(
                                  () => this.value = value,
                                )),
                      ),
                    ),
                    Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey, width: 2)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            value: value,
                            hint: Text("Time"),
                            // isExpanded: true,
                            icon: FaIcon(FontAwesomeIcons.chevronDown),
                            items: items.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(
                                  () => this.value = value,
                                )),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14),
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        value: value,
                        hint: Text("Complaints"),
                        isExpanded: true,
                        icon: FaIcon(FontAwesomeIcons.chevronDown),
                        items: items.map(buildMenuItem).toList(),
                        onChanged: (value) => setState(
                              () => this.value = value,
                            )),
                  ),
                ),
                SizedBox(height: 14),
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
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
                SizedBox(height: 14),
                Text(
                  "Resolved Details",
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 26,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 14),
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        value: value,
                        hint: Text("Date"),
                        isExpanded: true,
                        icon: FaIcon(FontAwesomeIcons.chevronDown),
                        items: items.map(buildMenuItem).toList(),
                        onChanged: (value) => setState(
                              () => this.value = value,
                            )),
                  ),
                ),
                SizedBox(height: 14),
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
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
                SizedBox(height: 60),
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
                      "Resolved",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    )),
                  )),
                ),
                SizedBox(height: 16),
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
                      "Pending",
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
