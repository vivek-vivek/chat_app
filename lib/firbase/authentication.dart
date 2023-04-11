import 'dart:developer';

import 'package:chat_app/data/provider/common_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class FirebaseAuths {
  final _auth = FirebaseAuth.instance;

  Future<void> userLogin(
    TextEditingController email,
    TextEditingController username,
    TextEditingController password,
    bool isLogin,
    context,
  ) async {
    Provider.of<CommonProviders>(context, listen: false).loding(true);
    UserCredential authResult;
    try {
      // if (isLogin) {
      authResult = await _auth.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      Provider.of<CommonProviders>(context, listen: false).loding(false);
    } on PlatformException catch (err) {
      var message = 'An erorr occured, please check your credentials!';
      if (err.message != null) {
        message = err.message!;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.redAccent,
        ),
      );
    } catch (err, s) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(err.toString()),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.redAccent,
        ),
      );
      log('---------------Erorr---------\n$err\n'
          '---------------Stack---------\n$s\n');
    }
  }

//------------------------------------------------------------------------------------------------

  // firebase userSignup
  Future<void> userSignup(
    TextEditingController email,
    TextEditingController password,
    TextEditingController username,
    bool isLogin,
    context,
  ) async {
    UserCredential authResult;
    try {
      Provider.of<CommonProviders>(context, listen: false).loding(true);
      authResult = await _auth.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(authResult.user!.uid)
          .set({
        'username': username.text,
        'email': email.text,
        
      });
      Provider.of<CommonProviders>(context, listen: false).loding(false);
    } on PlatformException catch (err) {
      var message = 'An erorr occured, please check your credentials!';
      if (err.message != null) {
        message = err.message!;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.redAccent,
        ),
      );
      Provider.of<CommonProviders>(context, listen: false).loding(false);
    } catch (err, s) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(err.toString()),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.redAccent,
        ),
      );
      Provider.of<CommonProviders>(context, listen: false).loding(false);
      log(
        '---------------Erorr---------\n$err\n'
        '---------------Stack---------\n$s\n',
      );
    }
  }
}
