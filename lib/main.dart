import 'package:flutter/material.dart';
import 'package:login/Screens/LoginForm.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login con Futter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginForm(),
    );
  }
}
