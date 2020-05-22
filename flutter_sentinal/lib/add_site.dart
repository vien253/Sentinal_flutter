import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sentinal/data/dao/site_dao.dart';
import 'package:flutter_sentinal/data/data_moor.dart';
import 'package:flutter_sentinal/home.dart';
import 'package:flutter_sentinal/setup_barns.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(AddSite());

class AddSite extends StatefulWidget {
  @override
  _AddSite createState() => _AddSite();
}
class _AddSite extends State<AddSite>{
  DateTime now;
  String i;
  TextEditingController sitenameController, siteaddressController,numofbarnController;
  FocusNode _nameFNode= FocusNode();
  FocusNode _addFNode= FocusNode();
  FocusNode _numFNode= FocusNode();

  File _image,_gallery;
  Future getGallery() async {
    var gallery = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = gallery;

    });
    List<int> imageBytes = await gallery.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    print(base64Image.substring(0, 100));
    i= base64Image;
  }
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
    List<int> imageBytes = await image.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    print(base64Image.substring(0, 100));
    i= base64Image;
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    siteaddressController = TextEditingController();
    sitenameController = TextEditingController();
    numofbarnController = TextEditingController();
    DateTime now = DateTime.now();
  }
  Future checkImage(){
    if(getGallery() == null)
      return getImage();
    else return getGallery();
  }
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Add New Site',textAlign: TextAlign.center,),),
        actions: <Widget>[
          FlatButton(
            child: Text('Next',style: TextStyle(
              color: Colors.red
            ),),

            onPressed: (){
                final database = Provider.of<SiteDao>(context, listen: false);
                final site = Site(
                    sitename: sitenameController.text.trim(), siteaddress: siteaddressController.text.trim(),imagesite: i, numofbarn: int.parse(numofbarnController.text.trim()));
                database.insertSite(site);
                print(site);


                Navigator.pushNamed(context, '/setup_barn',arguments: ScreenArguments(sitenameController.text.trim(), int.parse(numofbarnController.text.trim())));

            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        width: double.maxFinite,
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Center(
                  child: Container(
                    color: Colors.black26,
                    width: 150,
                    height: 200,
                    child: Stack(
                      children: <Widget>[
                        GestureDetector(
                          onTap:getGallery,
                          child: Container(
                            width: double.maxFinite,
                            height: double.maxFinite,
                            child: _image != null ? Image.file(_image):_gallery !=null?Image.file(_gallery):Text('Add Gallery \n +',textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 40,
                            height: 40,
                            color: Colors.black54,
                            child: Container(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                onPressed: getImage,
                                tooltip: 'Pick Image',
                                icon: Icon(Icons.add_a_photo,color: Colors.white,),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Text("Size name",),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: TextField(
                  controller: sitenameController,
                ),
              ),
              Text("Site Address",),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: TextField(
                  controller: siteaddressController,
                ),
              ),
              Text("Number of Barn"),
              TextField(
                keyboardType: TextInputType.number,
                controller: numofbarnController,
              ),


            ],
          ),
        ),
      ),

    );
  }
  void _CheckDataText(Text t){
    final database = Provider.of<SiteDao>(context, listen: false);
//    for(int i=0; i< database.sites.sitename.le; i++)
  }
  void onAdd() {
    setState(() {
//      if(sitenameController.text.trim().length < 1 || !_userController.text.contains('@'))
//        _checkUser = true;
//      else _checkUser = false;
//      if(_passController.text.length<6)
//        _checkPass = true;
//      else _checkPass= false;
//
//      print(_checkPass);
//      print(_checkUser);
//      if(_checkPass== false && _checkUser== false) {
//        Navigator.pushNamed(context, '/home');
//      }
    });
  }


}
class ScreenArguments {
  final String sitename;
  final int numofbarn;

  ScreenArguments(this.sitename, this.numofbarn);
}