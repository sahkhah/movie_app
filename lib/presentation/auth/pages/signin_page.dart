import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/common/helper/message/display_message.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/core/config/theme/app_color.dart';
import 'package:movie_app/data/auth/models/signin_req_param.dart';
import 'package:movie_app/domain/auth/usecases/signin.dart';
import 'package:movie_app/presentation/auth/pages/signup_page.dart';
import 'package:movie_app/presentation/home/page/home_page.dart';
import 'package:movie_app/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(left: 16, right: 16, top: 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signInText(),
            Gap(30),
            _emailField(),
            Gap(30),
            _passwordField(),
            Gap(70),
            _signinButton(),
            Gap(20),
            _signUpText(context),
          ],
        ),
      ),
    );
  }

  Widget _signInText() {
    return Text(
      'Sign In',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
    );
  }

  Widget _signUpText(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: 'Don\'t have an account? '),
          TextSpan(
            style: TextStyle(color: Colors.blue),
            text: 'Signup',
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

  Widget _signinButton() {
    return ReactiveButton(
      title: 'Sign In',
      activeColor: AppColors.primary,
      onPressed: () async {
        sl<SignInUsecase>().call(
          params: SignInReqParam(email: _email.text, password: _password.text),
        );
      },
      onSuccess: () {
        AppNavigation.pushRemove(context: context, widget: HomePage());
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(error, context);
      },
    );
  }
}
