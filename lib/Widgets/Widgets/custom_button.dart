// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Constants/colors.dart';
import 'custom_text.dart';

class CustomButtonElevated extends StatefulWidget {
  final String text;
  final Function onTap;
  final Widget? customPrefix;
  final Icon? customIcon;
  final double borderRadius;
  final Color textColor;
  Color buttonColor = primaryColor;
  CustomButtonElevated(
      {super.key,
      required this.text,
      required this.onTap,
      this.customPrefix,
      this.customIcon,
      this.borderRadius = 40.0,
      this.textColor = Colors.white,
      this.buttonColor = primaryColor});

  @override
  _CustomButtonElevatedState createState() => _CustomButtonElevatedState();
}

class _CustomButtonElevatedState extends State<CustomButtonElevated> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
        style: OutlinedButton.styleFrom(
          backgroundColor: widget.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
        onPressed: () => widget.onTap.call(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.customPrefix != null) widget.customPrefix!.pOnly(right: 2),
            CustomText(
              textKey: widget.text,
              color: widget.textColor,
            ),
            if (widget.customIcon != null) widget.customIcon!.pOnly(left: 15)
          ],
        ));
  }
}
