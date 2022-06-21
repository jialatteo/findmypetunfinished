import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:untitled/pages/chat_page.dart';
import 'package:untitled/pages/lost_pet_page.dart';
import 'package:untitled/pages/rivaan_lost_pet_page.dart';
import 'package:untitled/providers/user_provider.dart';
import 'package:untitled/models/user.dart' as model;
import '../services/auth_methods.dart';
import 'account_page.dart';

class LoggedInPage extends StatefulWidget {
  static String route = "LoggedInPage";
  const LoggedInPage({Key? key}) : super(key: key);
  @override
  State<LoggedInPage> createState() => _LoggedInPageState();
}

class _LoggedInPageState extends State<LoggedInPage> {
  // Future<bool> showExitPopup() async {
  //   return await showDialog(
  //         //show confirm dialogue
  //         //the return value will be from "Yes" or "No" options
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           title: Text('Do you want to exit FindMyPetSG?'),
  //           actions: [
  //             ElevatedButton(
  //               onPressed: () => Navigator.of(context).pop(false),
  //               //return false when click on "NO"
  //               child: Text('No'),
  //             ),
  //             ElevatedButton(
  //               onPressed: () => SystemNavigator.pop(),
  //               //return true when click on "Yes"
  //               child: Text('Yes'),
  //             ),
  //           ],
  //         ),
  //       ) ??
  //       false; //if showDialouge had returned null, then return false
  // }

  @override
  void initState() {
    super.initState();
    addData();
  }

  void addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  final pages = [
    RLostPetPage(),
    ChatPage(),
    AccountPage(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.black38,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.paw),
              label: "Lost pets",
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.chat),
              label: "Chats",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_sharp),
              label: "Profile",
            ),
          ],
          onTap: (index) => setState(() => currentIndex = index),
        ),
      ),
    );
  }
}
