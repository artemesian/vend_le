import 'dart:math';
import 'package:smart_select/smart_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import '../../widgets/Annonce_publish/InputText.dart';
import '../../widgets/Annonce_publish/DefaultImgPicker.dart';
import '../../widgets/Annonce_publish/DefaultPicker.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';


class Annonce extends StatefulWidget {
  @override
  _AnnonceState createState() => _AnnonceState();
}

class _AnnonceState extends State<Annonce> {
  File _image;
  File _image1;
  File _image2;
  File _image3;
  final picker = ImagePicker();
  var _selectedAnimals=["Electronique","vêtements"];
  List ville =["Doula","Yaoundé","Edea","Limbe"];
  var _selectedLocation;


  _imageFromCamera(File img) async {
    final image = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (image != null) {
        img = File(image.path);
      } else {
        print('No image selected !');
      }
    });
  } //picker for choose image in gallery

  _imageFromGallery(imag) async {
    final image =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (image != null) {
        imag = File(image.path);
      } else {
        print('No image selected !');
      }
    });
  } //picker for choose image in gallery

  void _showPicker (context,img) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Gallery Photo'),
                    onTap: () async{
                      /*_imageFromGallery(img);*/
                      final image = await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
                    
                      setState(() {
                        if (image != null) {
                          img = File(image.path);
                        } else {
                          print('No image selected !');
                        }
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imageFromCamera(_image);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  List <Categorie> _categorie=[
    Categorie(id:1, name: 'Electronique',subCategory: [Categorie(id: 1,name: 'Ordinateurs'),Categorie(id: 1,name: 'Tablette'),Categorie(id: 1,name: 'Telephones')]),
    Categorie(id:1, name: 'Véhicules'),
    Categorie(id:1, name: 'Vêtements'),
    Categorie(id:1, name: 'Terrain'),
  ];
  List <Categorie> _categorieSelected1=[];
  List <Categorie> _categorieSelected2=[];
  List <Categorie> _categorieSelected3=[];

String value = 'flutter';
List<S2Choice<String>> subCategorie = [
  S2Choice<String>(value: 'Doula', title: 'Doula'),
  S2Choice<String>(value: 'Edea', title: 'Edea'),
  S2Choice<String>(value: 'Yaoundé', title: 'Yaoundé'),
];




   _showMultiSelectDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (ctx) {
      return  MultiSelectDialog(
        items: _categorie.map<dynamic>((e) => MultiSelectItem(e, e.name)).toList(),
        initialValue: _selectedAnimals,
        onConfirm: (values) {
          print(values);
        },
      );
    },
  );
}



  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'Publier une annonce',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'bold',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: () {
                //  _showPicker(context,_image);
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext bc) {
                        return SafeArea(
                          child: Container(
                            child: new Wrap(
                              children: <Widget>[
                                new ListTile(
                                  leading: new Icon(Icons.photo_library),
                                  title: new Text('Gallery Photo'),
                                  onTap: () async{
                                    /*_imageFromGallery(img);*/
                                    final image = await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
                                  
                                    setState(() {
                                      if (image != null) {
                                        _image = File(image.path);
                                      } else {
                                        print('No image selected !');
                                      }
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                                new ListTile(
                                  leading: new Icon(Icons.photo_camera),
                                  title: new Text('Camera'),
                                  onTap: () async{
                                    //_imageFromCamera(_image);
                                    final image = await picker.getImage(source: ImageSource.camera);
                                    setState(() {
                                      if (image != null) {
                                        _image = File(image.path);
                                      } else {
                                        print('No image selected !');
                                      }
                                    });
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: _image != null  
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          _image,
                          height: queryData.size.height/3,
                          width: queryData.size.width,
                          fit: BoxFit.contain,
                        ),
                      )
                    : DefaultImgPicker(
                        width: 680,
                        height: 209,
                        imgWidth: 70,
                        imgHeight: 70,
                        title: 'Photo principale',
                      ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                         // _showPicker(context,_image1); {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext bc) {
                                return SafeArea(
                                  child: Container(
                                    child: new Wrap(
                                      children: <Widget>[
                                        new ListTile(
                                          leading: new Icon(Icons.photo_library),
                                          title: new Text('Gallery Photo'),
                                          onTap: () async{
                                            /*_imageFromGallery(img);*/
                                            final image = await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
                                          
                                            setState(() {
                                              if (image != null) {
                                                _image1 = File(image.path);
                                              } else {
                                                print('No image selected !');
                                              }
                                            });
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        new ListTile(
                                          leading: new Icon(Icons.photo_camera),
                                          title: new Text('Camera'),
                                          onTap: () async{
                                            //_imageFromCamera(_image);
                                            final image = await picker.getImage(source: ImageSource.camera);
                                            setState(() {
                                              if (image != null) {
                                                _image1 = File(image.path);
                                              } else {
                                                print('No image selected !');
                                              }
                                            });
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },                      
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:_image1 !=null? 
                            ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                            _image1,
                            height: 40,
                            width: 40,
                            fit: BoxFit.contain,
                          ),
                        ):
                        DefaultPicker(),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                         // _showPicker(context,_image2);
                          
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext bc) {
                                return SafeArea(
                                  child: Container(
                                    child: new Wrap(
                                      children: <Widget>[
                                        new ListTile(
                                          leading: new Icon(Icons.photo_library),
                                          title: new Text('Gallery Photo'),
                                          onTap: () async{
                                            /*_imageFromGallery(img);*/
                                            final image = await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
                                          
                                            setState(() {
                                              if (image != null) {
                                                _image2 = File(image.path);
                                              } else {
                                                print('No image selected !');
                                              }
                                            });
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        new ListTile(
                                          leading: new Icon(Icons.photo_camera),
                                          title: new Text('Camera'),
                                          onTap: () async{
                                            //_imageFromCamera(_image);
                                            final image = await picker.getImage(source: ImageSource.camera);
                                            setState(() {
                                              if (image != null) {
                                                _image2 = File(image.path);
                                              } else {
                                                print('No image selected !');
                                              }
                                            });
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          _image2 !=null? 
                            ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                            _image2,
                            height: 40,
                            width: 40,
                            fit: BoxFit.contain,
                          ),
                        ):
                           DefaultPicker(),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                         // _showPicker(context,_image3);
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext bc) {
                                return SafeArea(
                                  child: Container(
                                    child: new Wrap(
                                      children: <Widget>[
                                        new ListTile(
                                          leading: new Icon(Icons.photo_library),
                                          title: new Text('Gallery Photo'),
                                          onTap: () async{
                                            /*_imageFromGallery(img);*/
                                            final image = await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
                                          
                                            setState(() {
                                              if (image != null) {
                                                _image3 = File(image.path);
                                              } else {
                                                print('No image selected !');
                                              }
                                            });
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        new ListTile(
                                          leading: new Icon(Icons.photo_camera),
                                          title: new Text('Camera'),
                                          onTap: () async{
                                            //_imageFromCamera(_image3);
                                            final image = await picker.getImage(source: ImageSource.camera);
                                            setState(() {
                                              if (image != null) {
                                                _image3 = File(image.path);
                                              } else {
                                                print('No image selected !');
                                              }
                                            });
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          _image3 !=null? 
                            ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                            _image3,
                            height: 40,
                            width: 40,
                            fit: BoxFit.contain,
                          ),
                        ):
                           DefaultPicker(),
                        ),
                      ),
                    ],
                  ),
                  Text("Autres photos",style: TextStyle(color:Color(0XFF9B9797), ),),
                  SizedBox(height: queryData.size.height/20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        color: Color(0XFFEFF0F6),
                        width: queryData.size.width-queryData.size.width/6,
                        child: InputText(title: 'Titre',obscure: false,),
                      ),
                       Padding(
                         padding: const EdgeInsets.only(left:18.0),
                         child: Text("saissisez un titre court et précis",style: TextStyle(color:Color(0XFF9B9797) ),),
                       )
                    ],
                  ),
                  SizedBox(height: 15,),
                  
                 Container(
                   color: Color(0XFFEFF0F6), 
                    width: queryData.size.width-queryData.size.width/6,
                   child: InputText(
                     title: 'Prix',
                     obscure: false,
                    ),
                  ), 
                  SizedBox(height: 15,),
                  Container(
                    width: queryData.size.width-queryData.size.width/6,
                    decoration: BoxDecoration(),
                    child: 
                    MultiSelectDialogField(
                      chipDisplay:MultiSelectChipDisplay(
                        chipColor: Color(0XFF885FBF),
                        items: _categorieSelected1.map((categorie) => MultiSelectItem<Categorie>(categorie, categorie.name)).toList(),
                        onTap: (value) {
                          setState(() {
                            _categorieSelected1.remove(value);
                          });
                        },
                      ),
                      items: _categorie.map((categorie) => MultiSelectItem<Categorie>(categorie, categorie.name)).toList(),
                      title: Text("Catégorie",style: TextStyle(color: Color(0XFF885FBF),),),
                      selectedColor:Color(0XFF885FBF),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Color(0XFF885FBF),
                          width: 2,
                        ),
                      ),
                      buttonIcon: Icon(
                        Icons.home,
                        color: Color(0XFF885FBF),
                      ),
                      buttonText: Text(
                        "Catégorie",
                        style: TextStyle(
                          color: Color(0XFF885FBF),
                          fontSize: 16,
                        ),
                      ),
                      onConfirm: (results) {
                        this.setState(() {
                          _categorieSelected1 = results;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                   Container(
                    width: queryData.size.width-queryData.size.width/6,
                    decoration: BoxDecoration(),
                    child: 
                    MultiSelectDialogField(
                      chipDisplay:MultiSelectChipDisplay(
                        chipColor: Color(0XFF885FBF),
                        items: _categorieSelected2.map((categorie) => MultiSelectItem<Categorie>(categorie, categorie.name)).toList(),
                        onTap: (value) {
                          setState(() {
                            _categorieSelected1.remove(value);
                          });
                        },
                      ),
                      items: _categorie.map((categorie) => MultiSelectItem<Categorie>(categorie, categorie.name)).toList(),
                      title: Text("Sous Catégorie",style: TextStyle(color: Color(0XFF885FBF)),),
                      selectedColor:Color(0XFF885FBF),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color:Color(0XFF885FBF),
                          width: 2,
                        ),
                      ),
                      buttonIcon: Icon(
                        Icons.home,
                        color:Color(0XFF885FBF),
                      ),
                      buttonText: Text(
                        "Sous Catégorie",
                        style: TextStyle(
                          color: Color(0XFF885FBF),
                          fontSize: 16,
                        ),
                      ),
                      onConfirm: (results) {
                        this.setState(() {
                          _categorieSelected2 = results;
                        });
                      },
                    ),
                  ),
                  SizedBox(height:15),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                        color: Color(0XFF885FBF),
                        width: 2,
                      )),
                      width: queryData.size.width-queryData.size.width/6,
                      child: Center(
                        child: SmartSelect<String>.single(
                          placeholder: 'Selectionner votre Ville',
                          title: 'Ville',
                          value: value,
                          choiceItems: subCategorie,
                          onChange: (state) => setState(() => value = state.value)
                        ),
                      ),
                    ),
                    SizedBox(height:15),
                    Container(
                      color: Color(0XFFEFF0F6),
                      width: queryData.size.width-queryData.size.width/6,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          maxLines: 8,
                          decoration: InputDecoration.collapsed(hintText: "Description                                   0/300"),
                        ),
                      ),
                    ),
                    SizedBox(height:15),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                        color: Color(0XFF885FBF),
                        width: 2,
                      )),
                      width: queryData.size.width-queryData.size.width/6,
                      child: Center(
                        child: SmartSelect<String>.single(
                          placeholder: 'Selectionner la Qualité',
                          title: 'Qualité',
                          value: value,
                          choiceItems: subCategorie,
                          onChange: (state) => setState(() => value = state.value)
                        ),
                      ),
                    ),
                    SizedBox(height:30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:Color(0XFF885FBF),
                        onPrimary: Colors.white,
                        onSurface: Color(0XFF885FBF).withOpacity(0.2)
                      ),
                         
                      onPressed: (){

                      }, 
                      child: Text('Publier l\'annonce')
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(Icons.clear,color: Color(0XFF9B9797),),
                      Text('Annuler',style: TextStyle(color:  Color(0XFF9B9797),),)
                    ],),
                    SizedBox(height:20),
                    /*DropdownButton(
                    value: _selectedLocation,
                    onChanged: (String newValue) {
                      setState(() {
                        _selectedLocation = newValue;
                      });
                  },
                  items: ville.map((String location) {
                    return new DropdownMenuItem<String>(
                      child: new Text(location),
                    );
                  }).toList()*/
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


//classe Catégorie pour le mutiselect
class Categorie {
  final int id;
  final String name;
  final List<Categorie> subCategory;

  Categorie({
    this.id,
    this.name,
    this.subCategory
  });
}



/*MultiSelect(
    autovalidate: false,
    titleText: 'Categorie',
    validator: (value) {
      if (value == null) {
          return 'Selectionner une catégorie';
      }
    },
    errorText: 'Une erreur s\'est produite',
    hintText: 'Selectionner une catégorie',
    dataSource: [
      {
          "display": "Electronique",
          "value": 1,
      },
      {
          "display": "Vehicule",
          "value": 2,
      },
      {
          "display": "Terrain",
          "value": 3,
      },
      {
          "display": "Vêtements",
          "value": 4,
      }
    ],
    textField: 'display',
    valueField: 'value',
    filterable: true,
    required: true,
    value: null,
    onSaved: (value) {
      print('The value is $value');
    }
  ),*/
