import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class CustomButton extends StatefulWidget {
  bool filled;
  String label;
  final onpressd;
  CustomButton(
      {super.key, this.onpressd, this.filled = true, this.label = 'Submit'});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 160,
      ),
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: widget.filled ? Colors.black : null,
          border: Border.all(
            color: primaryNeutral,
          )),
      child: IntrinsicWidth(
        child: Center(
          child: Text(
            widget.label,
            style: TextStyle(
              color: widget.filled ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
