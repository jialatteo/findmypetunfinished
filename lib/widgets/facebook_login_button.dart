import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class FacebookLoginButton extends StatefulWidget {
  const FacebookLoginButton({Key? key, required this.onPressed})
      : super(key: key);
  final VoidCallback onPressed;
  @override
  State<FacebookLoginButton> createState() => _FacebookLoginButtonState();
}

class _FacebookLoginButtonState extends State<FacebookLoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      width: 299,
      child: SignInButton(Buttons.Facebook,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          onPressed: widget.onPressed,
          text: 'Continue with Facebook'),
    );
  }
}
