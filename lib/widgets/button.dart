import 'package:flutter/material.dart';

Widget button({
  required BuildContext context,
  required Function onTap,
  required String text,
  required Color color,
  required Color textColor,
}) {
  return GestureDetector(
    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: textColor),
        ),
      ),
    ),
    onTap: () {
      onTap();
    },
  );
}
