import 'package:flutter/material.dart';
import 'package:zoom_clone/controllers/auth_controller.dart';
import 'package:zoom_clone/screen/widget/custom_button.dart';
import 'package:zoom_clone/screen/widget/second_custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Start or join a meeting',
            style: TextStyle(
                color: Colors.black87,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5.0,
          ),
          Image.asset('assets/images/onboarding.jpg'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1),
            child: CustomButton(
              text: 'Login',
              onPressed: () {
                AuthController().signinWithGoogle();
                print('Authenticated!');
              },
            ),
          ),
          SecondCustomButton(
            text: 'Register',
            onPressed: () {
              print('You press register');
            },
          ),
        ],
      ),
    ));
  }
}
