import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  String hint;
  bool isPass;
  Function(String) onChange;
  TextEditingController controller;
  Widget icon;
  TextInputType inputType;

  AppTextField(
      {Key? key,
      required this.hint,
      this.isPass = false,
      required this.onChange,
      required this.controller,
      required this.icon,
      this.inputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          prefixIcon: icon,
          hintText: hint,
          fillColor: Colors.grey[200],
          filled: true,
        ),
        obscureText: isPass,
        keyboardType: inputType,
        validator: (val) => val?.length == 0 ? "por favor inserte $hint" : null,
        onChanged: (s) {
          onChange(s);
        },
        controller: controller,
      ),
    );
  }
}
