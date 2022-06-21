import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/widgets/arrow_back_button.dart';
import 'package:untitled/widgets/custom_textfield.dart';
import 'package:untitled/widgets/custom_signinup_button.dart';
import 'package:untitled/pages/logged_in_page.dart';
import 'package:untitled/pages/lost_pet_page.dart';
import 'package:untitled/pages/reset_password_page.dart';
import 'package:untitled/pages/welcome_page.dart';
import '../utils/showSnackBar.dart';
import '../widgets/password_textfield.dart';
import '../services/auth_methods.dart';

class LoginPage extends StatefulWidget {
  static String route = "LoginPage";
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isHiddenPassword = true;
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
    if (res == 'success') {
      Navigator.pushNamedAndRemoveUntil(
          context, LoggedInPage.route, (route) => false);
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /****** Arrow Back Button ********/
            Padding(
              padding: const EdgeInsets.only(left: 6, top: 20),
              child: ArrowBackButton(),
            ),

            /****** Log In Text********/
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Log in",
                    style: GoogleFonts.roboto(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // TODO: set prompt when wrong password/username
            /****** Email TextField ********/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomTextfield(
                labelText: "Email",
                textInputType: TextInputType.emailAddress,
                textEditingController: emailController,
              ),
            ),

            // TODO: set prompt when wrong password/username
            /****** Password TextField ********/
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: PasswordTextfield(
                labelText: "Password",
                isHiddenPassword: isHiddenPassword,
                textInputType: TextInputType.text,
                textEditingController: passwordController,
              ),
            ),

            // TODO: onPressed to log in
            /****** Log in button********/
            Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 18.0, top: 25.0, bottom: 10.0),
              child: CustomMadeButton(
                text: "Log in",
                onPressed: loginUser,
                isLoading: _isLoading,
                // routeName: LoggedInPage.route,
              ),
            ),

            // TODO: go to reset password page
            /****** Forgot Password text ********/
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    ResetPasswordPage.route,
                  );
                },
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
