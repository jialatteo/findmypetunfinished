import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/pages/login_page.dart';

class SmallLoginButton extends StatefulWidget {
  const SmallLoginButton({Key? key}) : super(key: key);

  @override
  State<SmallLoginButton> createState() => _SmallLoginButtonState();
}

class _SmallLoginButtonState extends State<SmallLoginButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 30,
          width: 85,
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, LoginPage.route);
            },
            child: Text(
              'Log in',
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  side: BorderSide(width: 2.0, color: Colors.black26),
                ),
              ),
              overlayColor:
                  MaterialStateColor.resolveWith((states) => Colors.black12),
            ),
          ),
        )
      ],
    );
  }
}
