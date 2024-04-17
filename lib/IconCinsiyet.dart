import 'package:flutter/material.dart';

class IconCinsiyet extends StatelessWidget {
  var cinsiyet = " ";
  final IconData icon;
  IconCinsiyet({required this.cinsiyet, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon as IconData?,
          size: 50,
          color: Colors.black,
        ),
        SizedBox(height: 10),
        Text(
          cinsiyet,
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
