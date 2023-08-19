import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  String title;
  bool isSecured;
  bool isEnabled;

  InputField(
      {required this.title, required this.isSecured, required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: isEnabled ? Colors.black : Colors.grey),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.transparent, width: 0),
                color: isEnabled
                    ? Color.fromARGB(255, 241, 241, 241)
                    : Colors.grey,
              ),
              child: TextField(
                enabled: isEnabled,
                obscureText: isSecured,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: title,
                    hintStyle: TextStyle(
                        color: isEnabled ? Colors.grey : Colors.white)),
              ),
            )
          ]),
    );
  }
}
