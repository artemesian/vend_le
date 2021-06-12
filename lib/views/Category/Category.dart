import 'dart:async';

import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import '../Annonce_publish/Annonce.dart';
import '../../widgets/Category/DefaultCard.dart';


class Category extends StatefulWidget {
   Category( );

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override

  List CategoryCard =[
    {
      "title":"MacBook Pro 15",
      "price":"300 000",
      'imgUrl':"./Images/staffeur.jpg",
      "profileUrl":'./Images/portrait.jpg',
      "name":"Mopi Gaetan"
    },
    {
      "title":"HP ZedBook",
      "price":"500 000",
      'imgUrl':"./Images/staffeur.jpg",
      "profileUrl":'./Images/portrait.jpg',
      "name":"Mopi Gaetan"
    },
    {
      "title":"Matebook Pro X",
      "price":"800 000",
      'imgUrl':"./Images/staffeur.jpg",
      "profileUrl":'./Images/portrait.jpg',
      "name":"Mopi Gaetan"
    },
    {
      "title":"MacBook Pro 2021",
      "price":"1 000 000",
      'imgUrl':"./Images/staffeur.jpg",
      "profileUrl":'./Images/portrait.jpg',
      "name":"Mopi Gaetan"
    },
  ];


  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(Icons.arrow_back),
            ),
            Text('Electronique',style: TextStyle(fontSize: 20),),
            SizedBox(width: 150,)
          ],),
          GridView.count(
            primary: false,
            padding: const EdgeInsets.all(1.5),
            crossAxisCount: 2,
            childAspectRatio: 0.80,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            children: [
              ...CategoryCard.map<Widget>((e) => DefaultCard
              (title: e['title'], 
              price: e['price'], 
              imgUrl: e['imgUrl'], 
              name: e['name'],
              profileUrl:e['profileUrl'],
              function: (){
                Navigator.pushNamed(context, '/Annonce');  
              },
              ))
            ],//new Cards()
            shrinkWrap: true,
          ),
        ],),
      ),
    );
  }
}

