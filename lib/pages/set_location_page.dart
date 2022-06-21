import 'package:flutter/material.dart';

// TODO: set location page
class SetLocationPage extends StatefulWidget {
  static String route = "SetLocationPage";

  const SetLocationPage({Key? key}) : super(key: key);

  @override
  State<SetLocationPage> createState() => _SetLocationPageState();
}

class _SetLocationPageState extends State<SetLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(
        'set location page',
        style: TextStyle(
          fontSize: 50,
        ),
      ),
    );
  }
}
