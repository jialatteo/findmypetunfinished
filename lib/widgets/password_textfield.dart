import 'package:flutter/material.dart';

class PasswordTextfield extends StatefulWidget {
  bool isHiddenPassword;
  final String labelText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  PasswordTextfield(
      {Key? key,
      required this.isHiddenPassword,
      required this.labelText,
      required this.textEditingController,
      required this.textInputType})
      : super(key: key);

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      keyboardType: widget.textInputType,
      obscureText: widget.isHiddenPassword,
      decoration: InputDecoration(
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.pink),
        ),
        labelText: widget.labelText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              widget.isHiddenPassword = !widget.isHiddenPassword;
            });
          },
          child: Icon(widget.isHiddenPassword
              ? Icons.visibility_off
              : Icons.visibility),
        ),
      ),
    );
  }
}
