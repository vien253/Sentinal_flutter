
import 'package:flutter/material.dart';
import 'package:flutter_sentinal/data/dao/barn_dao.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_sentinal/data/data_moor.dart';
import 'add_site.dart';


void main() => runApp(SetUpBarn());

class SetUpBarn extends StatefulWidget {

  @override
  _AddSite createState() => _AddSite();
}

class _AddSite extends State<SetUpBarn>{

 var nameController = [];
 var numController = [];




  @override
  Widget build(BuildContext context) {

    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    for(int i=0;i<args.numofbarn;i++){
      nameController.add(TextEditingController());
      numController.add(TextEditingController());
    }
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
              setState(() {
                final data = Provider.of<SetupBarnDao>(context, listen: false);
                for(int i=0;i< args.numofbarn;i++){
                  final barn = SetupBarn(barnname: nameController[i].text.trim(),numofbarn: int.parse(numController[i].text.trim()), sitename: args.sitename );
                  data.insertSetupBarn(barn);
                  print(data.watchSetupBarn());
                }


                Navigator.pushNamed(context, '/home');

//                final barn = SetupBarn(barnname: barnnameController.text,sitename: )


              });

            },
          )
        ],
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
        itemCount: args.numofbarn,
        itemBuilder: (context,index){
          return CartItemBarn(index);
        })

    );
  }
  Widget CartItemBarn (int index){
    final dem = index+1;
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Card(

        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Text("Barn $dem name"),
                Container(
                    width: 200,
                    child: TextField(

                      controller: nameController[index],
                    ))
              ],),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                Text("Num of pens"),
                Container(
                    width: 200,
                    child: TextField(

                        controller: numController[index],
                        textAlign: TextAlign.right))
              ],),
            )
          ],
        ),
      ),
    );

  }
}

