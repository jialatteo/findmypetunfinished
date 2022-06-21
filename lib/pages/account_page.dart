import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/pages/welcome_page.dart';
import 'package:untitled/services/auth_methods.dart';
import 'package:untitled/models/user.dart' as model;
import '../providers/user_provider.dart';
import 'logged_in_page.dart';

class AccountPage extends StatefulWidget {
  static String route = "AccountPage";
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    // final user = context.read<FirebaseAuthMethods>().user;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("uid: " + user.uid),
            Text("Email: " + user.email),
            Text("Display Name: " + user.displayName),
            ElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Log out of FindMyPetSG?"),
                  actions: [
                    TextButton(
                      onPressed: () => {
                        Navigator.pop(context, true),
                      },
                      child: Text("No"),
                    ),
                    TextButton(
                        onPressed: () async {
                          await AuthMethods().signOut();
                          Navigator.pop(context, true);
                          Navigator.pushReplacementNamed(
                              context, WelcomePage.route);
                          // context.read<AuthMethods>().signOut(context);
                          // Navigator.pop(context, true);
                        },
                        // onPressed: () {
                        //   int count = 0;
                        //   Navigator.popUntil(context, (route) => count++ == 3);
                        // },
                        child: Text("Yes")),
                  ],
                ),
              ),
              child: Text("Log Out"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Delete Account?"),
                  actions: [
                    TextButton(
                      onPressed: () => {
                        Navigator.pop(context, true),
                      },
                      child: Text("No"),
                    ),
                    TextButton(
                        onPressed: () {
                          // context.read<AuthMethods>().deleteAccount(context);
                          // Navigator.pop(context, true);
                        },
                        // onPressed: () {
                        //   int count = 0;
                        //   Navigator.popUntil(
                        //       context, (route) => count++ == 3);
                        // },
                        child: Text("Yes")),
                  ],
                ),
              ),
              child: Text("Delete Account"),
            ),
          ],
        ),
      ),
    );
  }
}
