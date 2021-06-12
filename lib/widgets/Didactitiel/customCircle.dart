import 'dart:ffi';

import 'package:flutter/material.dart';

class customCircle extends StatelessWidget {
  customCircle({@required this.color});

  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: Color(color),
        shape: BoxShape.circle,
      ),
    );
  }
}
