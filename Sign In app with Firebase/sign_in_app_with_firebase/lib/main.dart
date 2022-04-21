import 'package:flutter/material.dart';
import 'package:sign_in_app_with_firebase/app.sign_in/sign_in_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sign In App',
        theme: ThemeData(
          primaryColor: Colors.indigo,
        ),
        home: SignInPage());
  }
}
