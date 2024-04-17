import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyContainer extends StatelessWidget {
  final Color renk;
  final Widget child;
  final VoidCallback onPress;

  MyContainer(
      {this.renk = Colors.white,
      this.child = const Icon(FontAwesomeIcons.a),
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: renk,
        ),
      ),
    );
  }
}
