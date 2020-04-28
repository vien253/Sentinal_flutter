import 'package:flutter/material.dart';
import 'package:flutter_sentinal/setup_barns.dart';

void main() => runApp(AddSite());

class AddSite extends StatefulWidget {
  @override
  _AddSite createState() => _AddSite();
}
class _AddSite extends State<AddSite>{
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

    );
  }
}