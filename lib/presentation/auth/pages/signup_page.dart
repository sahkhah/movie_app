import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/common/helper/message/display_message.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/core/config/theme/app_color.dart';
import 'package:movie_app/data/auth/models/signup_req_param.dart';
import 'package:movie_app/domain/auth/usecases/signup.dart';
import 'package:movie_app/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SignupPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(left: 16, right: 16, top: 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signUpText(),
            Gap(30),
            _emailField(),
            Gap(30),
            _passwordField(),
            Gap(70),
            _signUpButton(),
            Gap(20),
            _signInText(context),
          ],
        ),
      ),
    );
  }

  Widget _signUpText() {
    return Text(
      'Sign up',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
    );
  }

  Widget _signInText(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: 'Already have an account? '),
          TextSpan(
            style: TextStyle(color: Colors.blue),
            text: 'Signin',
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigation.push(context: context, widget: SignupPage());
                  },
          ),
        ],
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      decoration: InputDecoration(hintText: 'Email'),
      controller: _email,
    );
  }

  Widget _passwordField() {
    return TextField(
      decoration: InputDecoration(hintText: 'Password'),
      controller: _password,
    );
  }

  Widget _signUpButton() {
    return ReactiveButton(
      title: 'Sign up',
      activeColor: AppColors.primary,
      onPressed: () async {
        await sl<SignupUsecase>().call(
          params: SignupReqParam(email: _email.text, password: _password.text),
        );
      },
      onSuccess: () {},
      onFailure: (error) {
        DisplayMessage.errorMessage(error, context);
      },
    );
  }
}
