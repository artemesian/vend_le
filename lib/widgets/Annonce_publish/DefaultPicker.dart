import 'package:flutter/material.dart';

class DefaultPicker extends StatelessWidget {
  DefaultPicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5),),color: Color(0XFF9B9797),),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('Images/camera.png',width: 20,height: 20,fit: BoxFit.contain,),
          ],
        )
    );
  }
}