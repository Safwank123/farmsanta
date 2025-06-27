
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color selectedColor, unselectedColor;

  const CustomSwitch(
      {super.key,
      required this.value,
      required this.onChanged,
      this.selectedColor = Colors.orange,
      this.unselectedColor = Colors.orangeAccent});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
        });
        widget.onChanged(_value);
      },
      child: Container(
        width: 30.0,
        height: 14.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          color: _value ? widget.selectedColor : widget.unselectedColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Align(
            alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width: 12.0,
              height: 12.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
