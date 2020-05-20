import 'package:flutter/material.dart';
import 'package:flutter_sentinal/data/data_moor.dart';
import 'package:flutter_sentinal/home.dart';
import 'package:flutter_sentinal/setup_barns.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

void main() => runApp(AddSite());

class AddSite extends StatefulWidget {
  @override
  _AddSite createState() => _AddSite();
}
class _AddSite extends State<AddSite>{
  DateTime now;
  TextEditingController sitenameController, siteaddressController,numofbarnController;
  FocusNode _nameFNode= FocusNode();
  FocusNode _addFNode= FocusNode();
  FocusNode _numFNode= FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    siteaddressController = TextEditingController();
    sitenameController = TextEditingController();
    numofbarnController = TextEditingController();
    DateTime now = DateTime.now();
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
                    sitename: sitenameController.text.trim(), siteaddress: siteaddressController.text.trim(), numofbarn: int.parse(numofbarnController.text.trim()) );
                database.insertSite(site);


                Navigator.pushNamed(context, '/setup_barn',arguments: ScreenArguments(sitenameController.text.trim(), int.parse(numofbarnController.text.trim())));

            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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