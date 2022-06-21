import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';
import 'package:untitled/pages/logged_in_page.dart';
import 'package:untitled/pages/login_page.dart';
import 'package:untitled/pages/welcome_page.dart';
import '../utils/pickImage.dart';
import '../utils/showSnackBar.dart';
import '../widgets/arrow_back_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_signinup_button.dart';
import '../widgets/password_textfield.dart';
import '../services/auth_methods.dart';
import 'lost_pet_page.dart';

class SignupPage extends StatefulWidget {
  static String route = "SignupPage";
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;
  bool isHiddenPassword = true;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    // signup user using our authmethodds
    String res = await AuthMethods().signUpUser(
      email: emailController.text.trim(),
      file: _image!,
      displayName: nameController.text.trim(),
      password: passwordController.text.trim(),
    );
    // if string returned is success, user has been created
    if (res == "success") {
      setState(() {
        _isLoading = false;
      });
      // navigate to the home screen
      Navigator.of(context).pushReplacementNamed(
        LoginPage.route,
      );
    } else {
      setState(() {
        _isLoading = false;
      });
      // show the error
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /****** Arrow Back Button ********/
              Padding(
                padding: const EdgeInsets.only(left: 6, top: 20),
                child: ArrowBackButton(),
              ),

              /****** Sign Up Text********/
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Sign Up",
                      style: GoogleFonts.roboto(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              /****** Add a profile photo icon ********/
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              'https://i.stack.imgur.com/l60Hf.png'),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ),
              // DottedBorder(
              //   dashPattern: [10, 3],
              //   color: Colors.pink,
              //   radius: Radius.circular(100),
              //   borderType: BorderType.RRect,
              //   child: SizedBox(
              //     height: 90,
              //     width: 90,
              //     child: IconButton(
              //         onPressed: () {},
              //         icon: Icon(
              //           Icons.person_add,
              //         ),
              //         iconSize: 30,
              //         color: Colors.pinkAccent),
              //   ),
              // ),
              /****** Add a profile photo text********/
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Add a profile photo",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),

              /****** name textfield ********/
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextfield(
                  labelText: "Display name",
                  textInputType: TextInputType.name,
                  textEditingController: nameController,
                ),
              ),

              /****** email textfield ********/
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextfield(
                  labelText: "Email",
                  textInputType: TextInputType.emailAddress,
                  textEditingController: emailController,
                ),
              ),

              /****** Password TextField ********/
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: PasswordTextfield(
                  labelText: "Password",
                  isHiddenPassword: isHiddenPassword,
                  textEditingController: passwordController,
                  textInputType: TextInputType.text,
                ),
              ),

              /****** Sign up button********/
              Padding(
                padding: const EdgeInsets.only(
                    right: 18.0, left: 18.0, top: 25.0, bottom: 10.0),
                child: CustomMadeButton(
                  onPressed: signUpUser,
                  isLoading: _isLoading,
                  text: "Create My Account",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
