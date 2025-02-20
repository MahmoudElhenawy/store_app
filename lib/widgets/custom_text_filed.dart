import 'package:flutter/material.dart';

class customTextFiled extends StatelessWidget {
  customTextFiled(
      {this.hintText, this.inputType, this.onChanged, this.obscureText});
  String? hintText;
  Function(String)? onChanged;
  bool? obscureText;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(), borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
