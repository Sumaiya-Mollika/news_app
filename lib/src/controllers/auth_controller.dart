import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/src/services/validation_service.dart';
import 'package:news_app/src/views/home_screen.dart';
import 'package:news_app/src/views/sign_in_screen.dart';
import 'package:news_app/src/widgets/extract_error_message.dart';

import '../widgets/custom_snackbar.dart';

class AuthenticationController extends GetxController with ValidationService {
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  final email = RxString('');
  final signInemail = RxString('');
  final password = RxString('');
  final signInPassword = RxString('');
  final confirmPassword = RxString('');
  final obscure = RxBool(true);
  final isObscure = RxBool(true);
  final loading = RxBool(false);

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initaialPage);
  }

  _initaialPage(User? user) {
    if (user == null) {
      Get.offAll(SignInScreen());
    } else {
      Get.offAll(HomeScreen());
    }
  }

  signUp(String email, password) async {
    loading.value = true;
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      loading.value = false;
      customSnackbar(title: 'Signup Success', message: 'Please Sign In', color: Colors.green, textColor: Colors.white);

      Get.offAll(SignInScreen());
    } catch (e) {
      loading.value = false;
      String errorMessage = extractErrorMessage(e.toString());

      customSnackbar(title: 'Signup Failed', message: errorMessage, color: Colors.red, textColor: Colors.white);
    }
  }

  signIn(String email, passwrod) async {
    loading.value = true;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: passwrod);
      loading.value = false;
      customSnackbar(title: 'SignIn Successfull', message: '', color: Colors.green, textColor: Colors.white);
    } catch (e) {
      loading.value = false;
      String errorMessage = extractErrorMessage(e.toString());
      customSnackbar(title: 'SignIn Failed', message: errorMessage, color: Colors.red, textColor: Colors.white);
    }
  }

  logOut() async {
    await auth.signOut();
  }

  bool isSubmitButtonValid() {
    if (email.value.contains('@') &&
        email.value.isNotEmpty &&
        password.value.isNotEmpty &&
        confirmPassword.value.isNotEmpty &&
        password.value == confirmPassword.value) {
      return true;
    } else {
      return false;
    }
  }

  clearValue() {
    email.value = '';
    password.value = '';
    confirmPassword.value = '';
    signInemail.value = '';
    signInPassword.value = '';
  }
}
