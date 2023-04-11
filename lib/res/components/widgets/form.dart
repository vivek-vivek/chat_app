// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:chat_app/data/provider/common_provider.dart';
import 'package:chat_app/firbase/authentication.dart';
import 'package:chat_app/firbase/authentication.dart';
import 'package:chat_app/res/constants/validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginFormWidget extends StatelessWidget {
  LoginFormWidget({
    super.key,
  });

  final _formkey = GlobalKey<FormState>();
  final TextEditingController _userEmail = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _userPassword = TextEditingController();

  void onSubmitForm({context}) {
    final isValid = _formkey.currentState?.validate();
    FocusScope.of(context).unfocus();
    log(isValid.toString());
    if (isValid!) {
      _formkey.currentState!.save();
      FirebaseAuths().userLogin(
        _userEmail,
        _username,
        _userPassword,
        true,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<CommonProviders>(context);
    return Form(
      key: _formkey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            validator: (value) {
              if (value!.isEmpty ||
                  !RegExp(Validator().email).hasMatch(value)) {
                return 'please enter a valid email adress';
              }
              return null;
            },
            onSaved: (newValue) => _userEmail.text = newValue.toString(),
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: 'Email Adress'),
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter a username';
              } else if (value.length < 5) {
                return "username must be at least 4 characters";
              }
              return null;
            },
            onSaved: (newValue) => _username.text = newValue.toString(),
            decoration: const InputDecoration(labelText: 'user name'),
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter a password';
              }

              return null;
            },
            onSaved: (newValue) => _userPassword.text = newValue.toString(),
            maxLength: 6,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => onSubmitForm(context: context),
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: prov.isLoadin
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text("Login"),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text("Dont have an account ?"),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: const Text("signup"),
              )
            ],
          )
        ],
      ),
    );
  }
}

//
//
//-----------------------------------------------------------------------------------------------------------
//
//

class SignupForm extends StatelessWidget {
  SignupForm({super.key});

  final _formkey = GlobalKey<FormState>();
  final TextEditingController _userEmail = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _userPassword = TextEditingController();

  void onSubmitForm({context}) {
    final isValid = _formkey.currentState?.validate();
    FocusScope.of(context).unfocus();
    log(isValid.toString());
    if (isValid!) {
      _formkey.currentState!.save();
      FirebaseAuths().userSignup(
        _userEmail,
        _userPassword,
        _username,
        true,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<CommonProviders>(context);
    return Form(
      key: _formkey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            validator: (value) {
              if (value!.isEmpty ||
                  !RegExp(Validator().email).hasMatch(value)) {
                return 'please enter a valid email adress';
              }
              return null;
            },
            onSaved: (newValue) => _userEmail.text = newValue.toString(),
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: 'Email Adress'),
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter a username';
              } else if (value.length < 5) {
                return "username must be at least 4 characters";
              }
              return null;
            },
            onSaved: (newValue) => _username.text = newValue.toString(),
            decoration: const InputDecoration(labelText: 'user name'),
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter a password';
              }

              return null;
            },
            onSaved: (newValue) => _userPassword.text = newValue.toString(),
            maxLength: 6,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              onSubmitForm(context: context);
            },
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: prov.isLoadin == true
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text("signup"),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text("Alredy have an account ?"),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("login"),
              )
            ],
          )
        ],
      ),
    );
  }
}
