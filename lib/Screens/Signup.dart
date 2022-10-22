import 'package:flutter/material.dart';
import 'package:login/Screens/LoginForm.dart';
import 'package:login/widgets/Helper.dart';
import 'package:login/widgets/app_checkBox.dart';
import 'package:login/widgets/app_radio_button.dart';
import 'package:toast/toast.dart';
import '../widgets/app_text_field.dart';

class SignupForm extends StatefulWidget {
  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  _SignupFormState() {
    _escolaridad = _escolaridades[0];
  }

  final _nameController = TextEditingController();
  final _conUserId = TextEditingController();
  final _conPassword = TextEditingController();
  bool isPass = true;
  final _escolaridades = ["Licenciatura", "Maestria", "Doctorado"];
  String? _escolaridad;
  stateEnum? _privateStateEnum;

  signUp(BuildContext context) {
    String uname = _nameController.text;
    String uid = _conUserId.text;
    String upassword = _conPassword.text;
    String? uescolaridad = _escolaridad;
    stateEnum? uenum = _privateStateEnum;

    if (uid.isEmpty) {
      alertDialog(context, "Por favor introduce un Usuario");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Crear cuenta e iniciar Sesion"),
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
                    "Registrarme",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 30.0),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Datos",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                        fontSize: 25.0),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    margin: EdgeInsets.only(top: 20.0),
                    child: AppTextField(
                      hint: "Nombre",
                      inputType: TextInputType.name,
                      onChange: (s) {},
                      controller: _nameController,
                      icon: Icon(Icons.person),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    margin: EdgeInsets.only(top: 20.0),
                    child: AppTextField(
                      hint: "Nombre de Usuario",
                      inputType: TextInputType.name,
                      onChange: (s) {},
                      controller: _conUserId,
                      icon: Icon(Icons.person_outline),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    margin: EdgeInsets.only(top: 20.0),
                    child: AppTextField(
                      hint: "Contraseña",
                      inputType: TextInputType.text,
                      isPass: isPass,
                      onChange: (s) {},
                      controller: _conPassword,
                      icon: GestureDetector(
                          onTap: () {
                            isPass = !isPass;
                            setState(() {});
                          },
                          child: Icon(Icons.lock)),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(20.0),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          labelText: "Escolaridades",
                        ),
                        value: _escolaridad,
                        items: _escolaridades
                            .map((eachItem) => DropdownMenuItem(
                                  child: Text(eachItem),
                                  value: eachItem,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            _escolaridad = val as String;
                          });
                        },
                        icon: const Icon(Icons.book),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          "Estado Civil",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            appRadioButton(
                                title: stateEnum.Casado.name,
                                value: stateEnum.Casado,
                                privateStateEnum: _privateStateEnum,
                                onChanged: (value) {
                                  setState(() {
                                    _privateStateEnum = value;
                                  });
                                }),
                            appRadioButton(
                                title: stateEnum.Soltero.name,
                                value: stateEnum.Soltero,
                                privateStateEnum: _privateStateEnum,
                                onChanged: (value) {
                                  setState(() {
                                    _privateStateEnum = value;
                                  });
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          "Habilidades Tecnicas",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ),
                      appCheckBox(title: "Java", onChange: (x) {}),
                      appCheckBox(title: "C++", onChange: (x) {}),
                      appCheckBox(title: "C#", onChange: (x) {}),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(30),
                    width: double.infinity,
                    child: TextButton(
                      child: Text(
                        "Registrarse",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: signUp(context),
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
                        Text("Ya tienes una cuenta?"),
                        TextButton(
                          child: Text("Iniciar Secion"),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => LoginForm()),
                              (Route<dynamic> route) => false,
                            );
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
