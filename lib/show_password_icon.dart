import 'package:flutter/material.dart';

class showPasswordIcon extends StatefulWidget {
  final ValueChanged<bool> onChanged;

  const showPasswordIcon({Key? key, required this.onChanged});

  @override
  State<showPasswordIcon> createState() => _showPasswordIconState();
}

class _showPasswordIconState extends State<showPasswordIcon> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isVisible = !isVisible;
        });
        widget.onChanged(isVisible);
      },
      icon: Icon(
        isVisible ? Icons.visibility_off : Icons.visibility,
      ),
    );
  }
}
