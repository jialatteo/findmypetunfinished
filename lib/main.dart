import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/firebase_options.dart';
import 'package:untitled/pages/account_page.dart';
import 'package:untitled/pages/chat_page.dart';
import 'package:untitled/pages/create_post_page.dart';
import 'package:untitled/pages/logged_in_page.dart';
import 'package:untitled/pages/lost_pet_page.dart';
import 'package:untitled/pages/lost_pet_post_page.dart';
import 'package:untitled/pages/report_abuse_page.dart';
import 'package:untitled/pages/reset_password_page.dart';
import 'package:untitled/pages/set_location_page.dart';
import 'package:untitled/pages/signup_page.dart';
import 'package:untitled/pages/welcome_page.dart';
import 'package:untitled/providers/user_provider.dart';
import 'package:untitled/services/auth_methods.dart';
import 'pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  // await Firebase.initializeApp(
  //   name: 'untitled',
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // MultiProvider(
        //   providers: [
        //     Provider<FirebaseAuthMethods>(
        //       create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        //     ),
        //     StreamProvider(
        //         create: (context) => context.read<FirebaseAuthMethods>().authState,
        //         initialData: null)
        //   ],
        //   child:
        MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.pink),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // Checking if the snapshot has any data or not
              if (snapshot.hasData) {
                return LoggedInPage();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }

            // means connection to future hasnt been made yet
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return const WelcomePage();
          },
        ),
        routes: {
          WelcomePage.route: (context) => WelcomePage(),
          LoginPage.route: (context) => LoginPage(),
          ResetPasswordPage.route: (context) => ResetPasswordPage(),
          LostPetPage.route: (context) => LostPetPage(),
          SetLocationPage.route: (context) => SetLocationPage(),
          ChatPage.route: (context) => ChatPage(),
          ReportAbusePage.route: (context) => ReportAbusePage(),
          SignupPage.route: (context) => SignupPage(),
          AccountPage.route: (context) => AccountPage(),
          LoggedInPage.route: (context) => LoggedInPage(),
          CreatePostPage.route: (context) => CreatePostPage(),
        },
        // ),
      ),
    );
  }
}

// class AuthWrapper extends StatelessWidget {
//   const AuthWrapper({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final firebaseUser = context.watch<User?>();
//
//     if (firebaseUser != null) {
//       return const LoggedInPage();
//     }
//     return const WelcomePage();
//   }
// }
