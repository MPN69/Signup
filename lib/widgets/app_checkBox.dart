import 'package:flutter/material.dart';

enum habilidades { Java, Csharp, CMasMas }

class appCheckBox extends StatefulWidget {
  appCheckBox({Key? key, required this.title, required this.onChange})
      : super(key: key);
  String title;

  Function(bool) onChange;

  @override
  State<appCheckBox> createState() => _appCheckBoxState();
}

class _appCheckBoxState extends State<appCheckBox> {
  bool select = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.title),
      activeColor: Colors.green,
      value: select,
      onChanged: (b) {
        widget.onChange(b!);
        select = !select;
        setState(() {});
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
