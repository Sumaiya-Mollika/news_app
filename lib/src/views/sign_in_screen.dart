import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:news_app/src/services/validation_service.dart';

import 'package:news_app/src/views/sign_up_screen.dart';
import 'package:news_app/src/widgets/loadding.dart';

import '../config/base.dart';

class SignInScreen extends StatelessWidget with Base, ValidationService {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Obx(
            () => Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 400,
                    decoration:
                        BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/background.png'), fit: BoxFit.fill)),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 30,
                          width: 80,
                          height: 200,
                          child: Container(
                            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/light-1.png'))),
                          ),
                        ),
                        Positioned(
                          left: 140,
                          width: 80,
                          height: 150,
                          child: Container(
                            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/light-2.png'))),
                          ),
                        ),
                        Positioned(
                          right: 40,
                          top: 40,
                          width: 80,
                          height: 150,
                          child: Container(
                            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/clock.png'))),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            margin: EdgeInsets.only(top: 50),
                            child: Center(
                              child: Text(
                                "SignIn",
                                style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
                            BoxShadow(color: Color.fromRGBO(143, 148, 251, .2), blurRadius: 20.0, offset: Offset(0, 10))
                          ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade100))),
                                child: TextField(
                                  onChanged: authC.signInemail,
                                  decoration: InputDecoration(
                                      errorText: validateEmail(authC.signInemail.value),
                                      border: InputBorder.none,
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  onChanged: authC.signInPassword,
                                  obscureText: authC.obscure.value,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: () => authC.obscure.toggle(),
                                        icon: Icon(
                                          authC.obscure.value ? EvaIcons.eyeOffOutline : EvaIcons.eyeOutline,
                                          color: Color.fromRGBO(143, 148, 251, 1),
                                        ),
                                      ),
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () => authC.signInemail.value.isNotEmpty && authC.signInPassword.value.isNotEmpty
                              ? authC.signIn(authC.signInemail.value, authC.signInPassword.value)
                              : null,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  authC.signInemail.value.isNotEmpty && authC.signInPassword.value.isNotEmpty
                                      ? Color.fromRGBO(143, 148, 251, 1)
                                      : Colors.grey.shade100,
                                  authC.signInemail.value.isNotEmpty && authC.signInPassword.value.isNotEmpty
                                      ? Color.fromRGBO(143, 148, 251, .6)
                                      : Colors.grey.shade100,
                                ])),
                            child: Center(
                              child: authC.loading.value
                                  ? Loading(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      "Sign In",
                                      style: TextStyle(
                                          color: authC.signInemail.value.isNotEmpty && authC.signInPassword.value.isNotEmpty
                                              ? Colors.white
                                              : Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account? ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.offAll(SignUpScreen());
                                authC.clearValue();
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1), fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
