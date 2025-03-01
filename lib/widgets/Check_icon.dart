import 'package:flutter/material.dart';

class CheckIcon extends StatefulWidget {
  const CheckIcon({super.key, required this.onChanged, required this.isclick});

  @override
  State<CheckIcon> createState() => _CheckIconState();
  final ValueChanged<bool> onChanged;
  final bool isclick;
}

class _CheckIconState extends State<CheckIcon> {

 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.isclick);
    
      },
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          color: widget.isclick ? const Color(0xff1B5E37) : null,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xffDDDFDF),
          ),
        ),
        child: widget.isclick
            ? const Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
