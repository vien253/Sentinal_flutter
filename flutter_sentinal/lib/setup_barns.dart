import 'package:flutter/material.dart';

void main() => runApp(SetUpBarn());

class SetUpBarn extends StatefulWidget {
  @override
  _AddSite createState() => _AddSite();
}
class _AddSite extends State<SetUpBarn>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Setup Barns',textAlign: TextAlign.center,),),
        actions: <Widget>[
          FlatButton(
            child: Text('Done',style: TextStyle(
                color: Colors.red
            ),),

            onPressed: (){
            },
          )
        ],
      ),

    );
  }
}