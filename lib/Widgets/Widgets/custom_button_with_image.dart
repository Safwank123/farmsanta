// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Constants/colors.dart';
import 'custom_text.dart';

class CustomButtonWithImage extends StatefulWidget {
  final String text;
  final Function onTap;
  final bool isBold;
  final String? imagePath;
  final double borderRadius;
  final double imageHeight;
  final double paddingValue;
  final double imageWidth;
  final Color textColor;
  final Color buttonColor;
  const CustomButtonWithImage(
      {Key? key,
      required this.text,
      required this.onTap,
      this.isBold = false,
      this.imagePath,
      this.borderRadius = 40.0,
      this.imageHeight = 16.0,
      this.imageWidth = 16.0,
      this.paddingValue = 0,
      this.textColor = Colors.white,
      this.buttonColor = primaryColor})
      : super(key: key);

  @override
  _CustomButtonWithImageState createState() => _CustomButtonWithImageState();
}

class _CustomButtonWithImageState extends State<CustomButtonWithImage> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: OutlinedButton.styleFrom(
        padding: widget.paddingValue == 0
            ? null
            : EdgeInsets.all(widget.paddingValue),
        backgroundColor: widget.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
      ),
      onPressed: () => widget.onTap.call(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (widget.imagePath != null)
            Image.asset(
              widget.imagePath!,
              height: widget.imageHeight,
              width: widget.imageWidth,
            ).p(2),
          Expanded(
            child: CustomText(
              textKey: widget.text,
              color: widget.textColor,
              size: 12,
              bold: widget.isBold,
            ),
          ),
        ],
      ),
    );
  }
}
