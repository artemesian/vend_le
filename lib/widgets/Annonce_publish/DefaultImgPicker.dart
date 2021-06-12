import 'package:flutter/material.dart';

class DefaultImgPicker extends StatelessWidget {
  DefaultImgPicker({
    @required this.width,
    @required this.height,
    this.title,
    this.padding,
    @required this.imgWidth,
    @required this.imgHeight
  });

  final double width;
  final double height;
  final String title;
  final double padding;
  final double imgWidth;
  final double imgHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Color(0XFF9B9797),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title==null? '':title,
            style: TextStyle(
              color: Color(0XFFE8E8E8),
              fontSize: 20
            ),
            textAlign: TextAlign.center,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('Images/camera.png',width: imgWidth,height: imgHeight,),
              SizedBox(height: 50,)
            ],
          )
        ],
      ),
    );
  }
}
