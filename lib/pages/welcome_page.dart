import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:untitled/widgets/facebook_login_button.dart';
import 'package:untitled/widgets/google_login_button.dart';
import 'package:untitled/widgets/small_login_button.dart';
import 'package:untitled/pages/login_page.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:untitled/pages/signup_page.dart';
import 'package:untitled/services/auth_methods.dart';

//TODO: welcome page
class WelcomePage extends StatefulWidget {
  static String route = "WelcomePage";
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              /****** Small Log In Button ********/
              Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    right: 16,
                  ),
                  child: SmallLoginButton()),

              /****** Find My Pet SG text ********/
              Text(
                'FindMyPetSG',
                style: GoogleFonts.acme(
                    fontSize: 60,
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold),
              ),

              /****** Dog Picture ********/
              Image(
                image: AssetImage('images/findpetsg.png'),
              ),
              /****** Google Login Button********/
              GoogleLoginButton(
                onPressed: () {
                  // context.read<FirebaseAuthMethods>().signInWithGoogle(context);
                },
              ),

              /****** Sign Up Button********/
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignupPage.route);
                  },
                  child: Text('Sign up for an account'),
                ),
              ),

              /****** Facebook LogIn Button********/
              SizedBox(
                height: 10,
              ),
              FacebookLoginButton(
                onPressed: () {
                  // context
                  //     .read<FirebaseAuthMethods>()
                  //     .signInWithFacebook(context);
                },
              ),

              /****** terms of service********/
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'By signing up, you agree to our ',
                    style: GoogleFonts.roboto(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    'Terms of Service',
                    style: GoogleFonts.roboto(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  Text(
                    ' and ',
                    style: GoogleFonts.roboto(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    'Privacy Policy',
                    style: GoogleFonts.roboto(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
