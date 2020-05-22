import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_sentinal/data/dao/site_dao.dart';
import 'package:flutter_sentinal/data/data_moor.dart';
import 'package:flutter_sentinal/drawer.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'add_site.dart';
import 'site_detail.dart';
import 'package:intl/intl.dart';

void main() => runApp(Home());
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddSite()));
              } ,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Column(
            children: <Widget>[
              Expanded(child: _ListHome2(context)),
            ],
          )
        ),

    );
  }
  Widget _inputImage(base64) {
    Uint8List _bytesImage;

    _bytesImage = Base64Decoder().convert(base64);
    return Image.memory(_bytesImage);
  }

  StreamBuilder<List<Site>> _ListHome2(BuildContext context){
    final database = Provider.of<SiteDao>(context);
    return StreamBuilder(
      stream:  database.watchAllSites(),
      builder: (context, AsyncSnapshot<List<Site>> snapsot){
        final sites = snapsot.data ?? List();
        return ListView.builder(
            itemCount: sites.length,
            itemBuilder: (_, index){
              final itemSite = sites[index];
              return _ListHome(itemSite , database.db);
            });
    },
    );
  }
  Widget _ListHome (Site itemSite, MyData data){
    final database = Provider.of<SiteDao>(context);
    final now = new DateTime.now();
    final formatter = new DateFormat();
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/siteDetail', arguments: ScreenArguments(itemSite.sitename,itemSite.imagesite,itemSite.numofbarn, now));
      },
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: ()=>
              database.deleteSite(itemSite)
            ,
          )
          
        ],
        child: Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Stack(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 70,
                      height: 70,
                      child: _inputImage(itemSite.imagesite),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(itemSite.sitename,style:
                            TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text("Updated: "+ itemSite.Updated.toString(),style:
                              TextStyle(
                                color: Colors.grey
                              ),),
                          ),
                          Row(
                            children: <Widget>[
                              Text("Count ",style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(itemSite.numofbarn.toString(),style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
                Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Icon(Icons.navigate_next,size: 40,color: Colors.grey,))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class ScreenArguments {
  final String sitename;
  final int numofbarn;
  final String siteimage;
  final DateTime date;

  ScreenArguments(this.sitename,this.siteimage, this.numofbarn,this.date);
}