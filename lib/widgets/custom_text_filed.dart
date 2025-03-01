import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.hintText,
    this.inputType,
    this.onChanged,
    this.labelText,
    this.isPassword = false,
    Key? key,
  }) : super(key: key);

  final String? hintText;
  final String? labelText;
  final Function(String)? onChanged;
  final TextInputType? inputType;
  final bool isPassword;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.inputType,
      obscureText: widget.isPassword ? _obscureText : false,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
