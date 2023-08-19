import 'package:flutter/material.dart';
import 'package:flutter_dynamic_form/Data/dynamic_data.dart';
import 'package:flutter_dynamic_form/dropdown_field.dart';
import 'package:flutter_dynamic_form/input_field.dart';
import 'package:get/get.dart';

class DynamicForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DynamicData dynamicData = DynamicData();

    return Scaffold(
      body: SafeArea(
          child: Container(
        width: Get.width,
        child: Column(children: [
          Text('Dynamic Form',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              )),
          SizedBox(
            height: 20,
          ),
          Container(
            width: Get.width,
            height: Get.height - 200,
            child: ListView.builder(
                itemCount: dynamicData.data.length + 1,
                itemBuilder: (context, index) {
                  var data = dynamicData.data;

                  if (index == dynamicData.data.length) {
                    return Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: null,
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(5),
                                  fixedSize: MaterialStateProperty.all(
                                      Size(Get.width / 2.5, 50)),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.grey)),
                            ),
                            ElevatedButton(
                              onPressed: null,
                              child: Text(
                                'Submit',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(5),
                                  fixedSize: MaterialStateProperty.all(
                                      Size(Get.width / 2.5, 50)),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.red)),
                            )
                          ]),
                    );
                  }

                  if (data[index]['inputType'] == 2) {
                    return DropdownField(
                        title: data[index]['title'].toString(),
                        isEnabled: bool.tryParse(
                                data[index]['isEnabled'].toString()) ??
                            true);
                  } else {
                    return InputField(
                        title: data[index]['title'].toString(),
                        isSecured: bool.tryParse(
                                data[index]['isPassword'].toString()) ??
                            false,
                        isEnabled:
                            bool.tryParse(data[index]['isEnable'].toString()) ??
                                false);
                  }
                }),
          )
        ]),
      )),
    );
  }
}


//Here our form is complete
// You can add Future builder to get data from Local Storage or from server
//just add fields and change the form
// this form is used when we have to change format after a few times