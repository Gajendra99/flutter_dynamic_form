import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownField extends StatefulWidget {
  String title;
  bool isEnabled;

  String selectedOption = 'Options 1';

  DropdownField({required this.title, required this.isEnabled});

  @override
  _DropdownField createState() => _DropdownField();
}

class _DropdownField extends State<DropdownField> {
  @override
  Widget build(BuildContext context) {
    final List<String> dropdownOptions = [
      'Options 1',
      'Options 2',
      'Options 3',
      'Options 4',
    ];
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title),
            SizedBox(
              height: 5,
            ),
            Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.transparent, width: 0),
                color: true ? Color.fromARGB(255, 241, 241, 241) : Colors.grey,
              ),
              child: DropdownButton<String>(
                value: widget.selectedOption,
                onChanged: (newValue) {
                  setState(() {
                    widget.selectedOption = newValue!;
                  });
                },
                items: dropdownOptions.map((option) {
                  return DropdownMenuItem<String>(
                      value: option, child: Text(option));
                }).toList(),
              ),
            )
          ]),
    );
  }
}
