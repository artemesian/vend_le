import 'package:flutter/material.dart';

class DefaultCard extends StatelessWidget {
  const DefaultCard({
  @required this.title,
  @required this.price,
  @required this.imgUrl,
   this.profileUrl,
  @required this.name,
  this.function
  });

  final String title;
  final String price;
  final String imgUrl;
  final String profileUrl;
  final String name;
  final Function function;
  @override
  
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0XFF643A71),
            image: DecorationImage(
              image:AssetImage('$imgUrl'),
              fit: BoxFit.cover
              )
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          ListTile(
            title: Text("$title",style: TextStyle(color: Color(0XFFFFF6F6)),),
            subtitle: Text('$price',style: TextStyle(color: Color(0XFFFFF6F6)),) ,
          ),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(bottom:8.0,left: 8.0),
              child: Container(
                height: 35,
                width: 34,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: profileUrl==null ?
                     (AssetImage('./Images/user.png',))
                    :
                    AssetImage('$profileUrl',),
                    fit: BoxFit.cover,
                    )
                ),
                child:Container(),
           
            ),
            ),
             Padding(
               padding: const EdgeInsets.only(bottom:8.0),
               child: Text("   $name",style: TextStyle(color: Color(0XFFFFF6F6),),),
             )
            ]
        )],)
        ),),
    );
  }
}