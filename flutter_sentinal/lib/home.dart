import 'package:flutter/material.dart';
import 'package:flutter_sentinal/drawer.dart';
import 'add_site.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey[100]
      ),
      home: Home(),
    );
  }
}
final _listHome = <String>["s","a","fsdf","ầ"];
class Home extends StatefulWidget{
  @override
  _Home createState() => _Home();
}
class _Home extends State<Home>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Center(child: Text('My Sites',textAlign: TextAlign.center,)),
        actions: <Widget>[
          FlatButton(
            child: Text('Add Site'),
            textColor: Colors.red,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (cotext) => AddSite()));
            } ,
          )
        ],
      ),
      body: ListView.builder(
          itemCount: _listHome.length,
          itemBuilder: (context,index){
            return ListHome(_listHome[index]);
      }),
    );
  }
  Widget ListHome (String s){
    return Card(
      child: ListTile(
        leading: Image.asset('assets/item_card.png'),
        title: Text(s),
      ),
    );
  }
}

