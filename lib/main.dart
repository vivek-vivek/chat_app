import 'package:chat_app/data/provider/common_provider.dart';
import 'package:chat_app/res/style/colors.dart';
import 'package:chat_app/view/chat_home.dart';
import 'package:chat_app/view/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/view/login_screen.dart';
import 'package:chat_app/view/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CommonProviders>(
          create: (context) => CommonProviders(),
        )
      ],
      child: MaterialApp(
        title: 'Chat App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          scaffoldBackgroundColor: Colors.white,
          buttonTheme: ButtonTheme.of(context).copyWith(
            buttonColor: Mycolors.purple,
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        // initialRoute: '/',
        routes: {
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignupScreen(),
          '/chathome': (context) => const ChatHome(),
          '/chatscreen': (context) => const ChatScreen(),
        },
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, usersnapshort) {
            if (usersnapshort.hasData) {
              return const ChatHome();
            }
            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
