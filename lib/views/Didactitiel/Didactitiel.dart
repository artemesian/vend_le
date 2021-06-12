import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../../widgets/Didactitiel/reusableButton.dart';
import '../../widgets/Didactitiel/customCircle.dart';

class Didactitiel extends StatefulWidget {
  @override
  _DidactitielState createState() => _DidactitielState();
}

class _DidactitielState extends State<Didactitiel> {
  @override
  var inc = 0;

  void Suivant() {
    
      if (inc >= 2) {
       /* setState(() {
        inc = 0;
        });*/
        Navigator.pushNamed(context, '/Annonce');
      } else {
        this.setState(() {
          inc += 1;
        });
        
        
      }
  }

  var pages = [
    {
      "message": "Bienvenue sur VendLe",
      "num": 1,
    },
    {
      "message":
          "Un produit que vous n'utilisez ou encore un service que vous offrez et Bahhhh vous êtes au bon endroit",
      "num": 2,
    },
    {
      "message": "trouvez satisfaction sur VendLe",
      "num": 3,
    }
  ];

  Widget build(BuildContext context) {
    @override
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    print(pages[inc]['message']);

    return Scaffold(
      body: AspectRatio(
        aspectRatio: queryData.size.width / queryData.size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: queryData.size.height / 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                reusableButton(
                  text: 'Passer',
                  color: Colors.white,
                  width: 100.0,
                  textColor: Color(0XFF885FBF),
                  function: () => {
                    setState(() {
                      inc = 2;
                    })
                  },
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
            Expanded(
              child: Image.asset(
                'Images/didac${pages[inc]['num']}.png',
                height: queryData.size.height / 3,
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 30),
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  pages[inc]['message'],
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customCircle(
                  color: (inc == 0) ? 0xff8962bf : 0xffc3afdf,
                ),
                SizedBox(
                  width: 5,
                ),
                customCircle(color: (inc == 1) ? 0xff8962bf : 0xffc3afdf),
                SizedBox(
                  width: 5,
                ),
                customCircle(color: (inc == 2) ? 0xff8962bf : 0xffc3afdf),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            reusableButton(
              text: 'Suivant',
              color: Color(0XFF885FBF),
              width: 130.0,
              textColor: Colors.white,
              function: Suivant,
            ),
            SizedBox(
              height: queryData.size.height / 15,
            )
          ],
        ),
      ),
    );
  }
}
