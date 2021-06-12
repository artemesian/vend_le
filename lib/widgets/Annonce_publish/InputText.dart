import 'package:flutter/material.dart';


class InputText extends StatelessWidget {
  const InputText({
    this.title,
   @required this.obscure
  });
  final String title;
  final bool obscure;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: '$title',
      ),
    );
  }
}