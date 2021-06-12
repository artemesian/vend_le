import 'package:flutter/material.dart';
//import 'package:intralink/Annonce/screens/Annonce.dart';
// import 'package:intralink/Clima/screens/loading_screen.dart';
// import './dice.dart';
import './views/Annonce_publish/Annonce.dart';
import './views/Category/Category.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/Category':(context)=>Category(),
        '/Annonce':(context)=>Annonce()
      },
      home: Category(),
    );
  }
}
