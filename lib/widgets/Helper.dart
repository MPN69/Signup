import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

alertDialog(BuildContext context, String nsg) {
  Toast.show("Por favor ingrese un Usuario",
      duration: Toast.lengthLong, gravity: Toast.bottom);
}
