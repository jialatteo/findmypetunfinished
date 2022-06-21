import 'package:flutter/material.dart';

// TODO: report abuse page
class ReportAbusePage extends StatefulWidget {
  static String route = "ReportAbusePage";
  const ReportAbusePage({Key? key}) : super(key: key);

  @override
  State<ReportAbusePage> createState() => _ReportAbusePageState();
}

class _ReportAbusePageState extends State<ReportAbusePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(
        "report abuse page",
        style: TextStyle(
          fontSize: 50,
        ),
      ),
    );
  }
}
