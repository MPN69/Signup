import 'package:flutter/material.dart';
import '../Screens/Signup.dart';

enum stateEnum { Soltero, Casado }

class appRadioButton extends StatelessWidget {
  appRadioButton({
    Key? key,
    required this.title,
    required this.value,
    required this.privateStateEnum,
    required this.onChanged,
  }) : super(key: key);

  String title;
  stateEnum value;
  stateEnum? privateStateEnum;
  Function(stateEnum?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile<stateEnum>(
        title: Text(title),
        contentPadding: EdgeInsets.all(0),
        value: value,
        groupValue: privateStateEnum,
        onChanged: onChanged,
      ),
    );
  }
}
