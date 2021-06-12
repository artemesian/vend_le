import 'package:flutter/material.dart';
import './views/Annonce_publish/Annonce.dart';
import './views/Category/Category.dart';
import './views/Didactitiel/Didactitiel.dart';
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
      home: Didactitiel(),
    );
  }
}
