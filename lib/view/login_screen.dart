import 'package:chat_app/res/style/colors.dart';
import 'package:flutter/material.dart';

import '../res/components/widgets/form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.grey1,
      body: Center(
        child: Card(
          color: Mycolors.white1,
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: LoginFormWidget(),
          ),
        ),
      ),
    );
  }
}
