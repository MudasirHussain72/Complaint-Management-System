import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  void ontap;
  var color;
  var text;
  var textColor;

  RoundedButton({
    super.key,
    required this.color,
    required this.ontap,
    required this.text,
    required this.textColor,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => ontap,
        child: Container(
          height: 56,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            color: color,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: 18, fontWeight: FontWeight.w500),
          )),
        ));
  }
}
