// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:farmsanta_new/Core/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Constants/colors.dart';

class CustomInputField extends StatefulWidget {
  final String hint;
  final String? label;
  final bool isNumber;
  final bool isExperience;
  final bool containDecimal;
  final bool isEmail;
  final bool isOtp;
  final bool isWeb;
  final bool isName;
  final bool isRequired;
  bool isPassword;
  final String errorMessage;
  final String initialValue;
  final bool isMobileNumber;
  final Icon hintIcon;
  final bool showIcon;
  final bool isFocused;
  final bool isEditable;
  Color? fillColor;
  double? borderRadius;
  bool showPasswordEye;
  bool password;
  Widget? prefixWidget;
  Widget? suffixWidget;
  final TextEditingController textEditingController;
  CustomInputField({
    Key? key,
    required this.hint,
    this.label = "",
    this.isFocused = false,
    this.isEditable = true,
    this.isNumber = false,
    this.isRequired = false,
    this.isExperience = false,
    this.containDecimal = false,
    this.isEmail = false,
    this.showPasswordEye = false,
    this.isOtp = false,
    this.isWeb = false,
    this.isName = false,
    this.showIcon = false,
    this.isPassword = false,
    this.errorMessage = "",
    this.initialValue = "",
    this.password = false,
    this.fillColor = textFieldLightColor,
    this.borderRadius,
    this.hintIcon = const Icon(
      Icons.keyboard,
    ),
    this.prefixWidget,
    this.suffixWidget,
    required this.textEditingController,
    this.isMobileNumber = false,
  }) : super(key: key);

  @override
  CustomInputFieldState createState() => CustomInputFieldState();
}

class CustomInputFieldState extends State<CustomInputField> {
  String? errorText;
  @override
  Widget build(BuildContext context) {
    if (widget.initialValue != "") {
      widget.textEditingController.text = widget.initialValue;
    }
    return TextFormField(
      style: TextStyle(fontSize: 14),
      enabled: widget.isEditable,
      autofocus: widget.isFocused,
      cursorColor: primaryColor,
      inputFormatters: [
        TextInputFormatter.withFunction((oldValue, newValue) {
          if (newValue.text.isEmpty) {
            return newValue;
          }
          if (widget.isMobileNumber || widget.isNumber) {
            if (double.tryParse(newValue.text) == null) {
              return oldValue;
            }

            if (newValue.text.contains(" ")) {
              return oldValue;
            }
            if (newValue.text.toString().contains("+") ||
                newValue.text.toString().contains("-") ||
                newValue.text.toString().contains(".")) {
              return oldValue;
            }
            if (widget.isMobileNumber) {
              if (newValue.text.length == 10) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
              if (newValue.text.length > 10) {
                return oldValue;
              }
            }
            if (widget.isOtp) {
              if (newValue.text.length == 6) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
              if (newValue.text.length > 6) {
                return oldValue;
              }
            }
            if (widget.isExperience) {
              if (newValue.text.length == 3) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
              if (newValue.text.length > 3) {
                return oldValue;
              }
            }
          }

          return newValue;
        })
      ],
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        errorText: errorText != null ? errorText!.translate() : errorText,
        focusColor: primaryColor,
        hintText: widget.hint.translate(),
        fillColor: widget.fillColor,
        filled: true,
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: textFieldLightColor, width: 1.2),
          borderRadius:  BorderRadius.circular(widget.borderRadius  ?? 5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1.2),
          borderRadius: BorderRadius.circular(widget.borderRadius  ?? 5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1.2),
          borderRadius: BorderRadius.circular(widget.borderRadius  ?? 5),
        ),
        prefixIcon: widget.prefixWidget,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  widget.showPasswordEye
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: primaryColor,
                ),
                onPressed: () {
                  setState(() {
                    widget.showPasswordEye = !widget.showPasswordEye;
                    widget.password = !widget.password;
                  });
                },
              )
            : widget.suffixWidget,
      ),
      keyboardType: widget.isMobileNumber
          ? TextInputType.phone
          : widget.isNumber
              ? widget.containDecimal
                  ? const TextInputType.numberWithOptions(
                      signed: false, decimal: true)
                  : const TextInputType.numberWithOptions(
                      signed: false, decimal: false)
              : TextInputType.text,
      validator: (value) {
        return checkValue(value);
      },
      onChanged: (value) {
        errorText = checkValue(value);
        setState(() {});
      },
      obscureText: widget.password,
      controller: widget.textEditingController,
    );
  }

  checkValue(value) {
    if (widget.errorMessage != "") {
      if (value == "") return widget.errorMessage;

      if (widget.isMobileNumber) {
        if (widget.isOtp) {
          if (value!.length != 6) {
            return widget.errorMessage;
          }
        } else if (value!.length != 10) {
          return widget.errorMessage;
        } else if (double.tryParse(value) == null) {
          return widget.errorMessage;
        } else if (value.toString().contains(" ") ||
            value.toString().endsWith(" ")) {
          return widget.errorMessage;
        } else if (value.toString().contains("+") ||
            value.toString().contains("-") ||
            value.toString().contains(".")) {
          return widget.errorMessage;
        }
      } else if (widget.isPassword) {
        if (value!.length < 6) return widget.errorMessage;
      } else if (widget.isName) {
        if (value != null) {
          bool isNum = double.tryParse(value) != null;
          if (isNum || value.length < 3) {
            return widget.errorMessage;
          }
        }
      } else if (widget.isNumber) {
        bool isNum = double.tryParse(value) != null;
        if (!isNum) {
          return "Only numbers are required";
        }
      }
    }
    return null;
  }
}
