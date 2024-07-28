import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nex/third.dart';

class AuthService {
  Future<void> signup({
    required String email,
    required String password,
    required BuildContext context,
    // required String username,
    // required String phoneNumber,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await Future.delayed(const Duration(seconds:1));
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context) =>  Third()));


    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'Password should be at least 6 characters long';
      } else if (e.code == 'email-already-in-use') {
        message = 'Email already in use';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } catch (e) {
      /*
      Fluttertoast.showToast(
        msg: 'An unexpected error occurred',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );*/
    }
  }
}
