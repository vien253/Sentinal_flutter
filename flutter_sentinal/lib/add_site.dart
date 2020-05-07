import 'package:flutter/material.dart';
import 'package:flutter_sentinal/setup_barns.dart';

void main() => runApp(AddSite());

class AddSite extends StatefulWidget {
  @override
  _AddSite createState() => _AddSite();
}
class _AddSite extends State<AddSite>{
  FocusNode _nameFNode= FocusNode();
  FocusNode _addFNode= FocusNode();
  FocusNode _numFNode= FocusNode();
  @override
  Widget build(BuildContext context) {
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => SetUpBarn()));
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
              child: TextField(),
            ),
            Text("Site Address",),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: TextField(),
            ),
            Text("Number of Barn"),
            TextField(),
          ],
        ),
      ),

    );
  }
}