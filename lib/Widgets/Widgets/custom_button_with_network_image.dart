// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api


import 'package:farmsanta_new/Widgets/classes/widget_helper_class.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Constants/colors.dart';
import 'custom_text.dart';

class CustomButtonWithNetworkImage extends StatefulWidget {
  final String text;
  final Function onTap;
  final String? imagePath;
  final double borderRadius;
  final double imageHeight;
  final double imageWidth;
  final Color textColor;
  final Color buttonColor;
  const CustomButtonWithNetworkImage(
      {Key? key,
      required this.text,
      required this.onTap,
      this.imagePath,
      this.borderRadius = 40.0,
      this.imageHeight = 16.0,
      this.imageWidth = 16.0,
      this.textColor = Colors.white,
      this.buttonColor = primaryColor})
      : super(key: key);

  @override
  _CustomButtonWithNetworkImageState createState() =>
      _CustomButtonWithNetworkImageState();
}

class _CustomButtonWithNetworkImageState
    extends State<CustomButtonWithNetworkImage> {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.imagePath != null)
              WidgetHelper()
                  .getCachedImage(
                    widget.imagePath!,
                    widget.imageHeight,
                    widget.imageWidth,
                    boxFit: BoxFit.contain,
                  )
                  .w(5),
            CustomText(
              textKey: widget.text,
              color: widget.textColor,
              size: 15,
            ),
          ],
        ));
  }
}
