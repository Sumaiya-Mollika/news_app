import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:news_app/src/services/validation_service.dart';
import 'package:news_app/src/views/sign_in_screen.dart';
import 'package:news_app/src/widgets/loadding.dart';

import '../config/base.dart';

class SignUpScreen extends StatelessWidget with Base, ValidationService {
  @override
  Widget build(BuildContext context) {
    // authC.clearValue();
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
                                "SignUp",
                                style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
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
                                  onChanged: authC.email,
                                  decoration: InputDecoration(
                                      errorText: validateEmail(authC.email.value),
                                      border: InputBorder.none,
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  onChanged: authC.password,
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
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  onChanged: authC.confirmPassword,
                                  obscureText: authC.isObscure.value,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: () => authC.isObscure.toggle(),
                                        icon: Icon(
                                          authC.isObscure.value ? EvaIcons.eyeOffOutline : EvaIcons.eyeOutline,
                                          color: Color.fromRGBO(143, 148, 251, 1),
                                        ),
                                      ),
                                      border: InputBorder.none,
                                      hintText: "Confrim Password",
                                      errorText: validateConfirmPassword(authC.password.value, authC.confirmPassword.value),
                                      hintStyle: TextStyle(color: Colors.grey[400])),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () => authC.isSubmitButtonValid() ? authC.signUp(authC.email.value, authC.password.value) : null,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                //  Colors.amber.withOpacity(authC.isSubmitButtonValid() ? 1 : .6),
                                gradient: LinearGradient(colors: [
                                  authC.isSubmitButtonValid() ? Color.fromRGBO(143, 148, 251, 1) : Colors.grey.shade100,
                                  authC.isSubmitButtonValid() ? Color.fromRGBO(143, 148, 251, .6) : Colors.grey.shade100,
                                ])),
                            child: Center(
                              child: authC.loading.value
                                  ? Loading(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: authC.isSubmitButtonValid() ? Colors.white : Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.offAll(SignInScreen());
                                authC.clearValue();
                              },
                              child: Text(
                                'Sign In',
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
