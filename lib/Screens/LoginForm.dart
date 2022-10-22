import 'package:flutter/material.dart';
import 'package:login/Screens/Signup.dart';
import 'package:login/widgets/app_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _conUserId = TextEditingController();
  final _conPassword = TextEditingController();

  bool isPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login con Flutter"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50.0),
                  Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 30.0),
                  ),
                  SizedBox(height: 5.0),
                  Image.asset(
                    "assets/images/login.png",
                    height: 160.0,
                    width: 200.0,
                  ),
                  SizedBox(height: 7),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    margin: EdgeInsets.only(top: 20.0),
                    child: AppTextField(
                      inputType: TextInputType.name,
                      hint: "Nombre de usuario",
                      onChange: (s) {},
                      controller: _conUserId,
                      icon: Icon(Icons.person),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    margin: EdgeInsets.only(top: 20.0),
                    child: AppTextField(
                      onChange: (s) {},
                      hint: "Passord",
                      isPass: isPass,
                      controller: _conPassword,
                      icon: GestureDetector(
                          onTap: () {
                            isPass = !isPass;
                            setState(() {});
                          },
                          child: Icon(Icons.lock)),
                    ),
                  ),
                  //TextButton(onPressed: (){print(usrController.text);}, child: Text("Imprimir a lv")),
                  //RawMaterialButton(onPressed: (){},
                  //  fillColor: Colors.blueGrey,
                  //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  //child: Container(
                  //  height: 50,
                  //  width: 150,
                  //  decoration: BoxDecoration(
                  //    borderRadius:  BorderRadius.circular(30),
                  //  border: Border.all(color: Colors.red.withOpacity(1),width: 2)),
                  //    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                  //    child: Center(child:Text("hoa mancita"))),)
                  Container(
                    margin: EdgeInsets.all(30),
                    width: double.infinity,
                    child: TextButton(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("No tienes una cuenta?"),
                        TextButton(
                          child: Text("Crear Una"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SignupForm()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
