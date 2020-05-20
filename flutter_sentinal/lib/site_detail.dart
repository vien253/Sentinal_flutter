import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sentinal/home.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:flutter_sentinal/data/data_moor.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

void main() => runApp(SiteDetail());
class SiteDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return state_full();
  }
}
class state_full extends StatefulWidget{
  @override
  _state_full createState() => _state_full();
}
class _state_full extends State<state_full>{

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    // TODO: implement build
    return WillPopScope(

      onWillPop: () async{
//        Fluttertoast.showToast(msg: "test");
        return true;
    },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.maxFinite,
                    child: Image.asset("assets/bg_big.png",fit: BoxFit.fill,),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                      onPressed: (){
//                        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                          Navigator.pop(context);

                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.fromLTRB(0, 30, 10, 0),
                    child: _buildPopupMenu()
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(10, 200, 0, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(args.sitename,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 30),
                          child: Text("Updated: Mar 14, 2020 9:51 PM",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.left,),
                        ),
                        Text(args.numofbarn.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Text("Total Count",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: _StreamDetail(context)
              )
            ],
          ),
        ),
      ),
    );
  }
  StreamBuilder<List<SetupBarn>> _StreamDetail(BuildContext context){
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    final database = Provider.of<SetupBarnDao>(context);
    return StreamBuilder(
      stream:  database.watchSetupBarnSiteName(args.sitename),
      builder: (context, AsyncSnapshot<List<SetupBarn>> snapshot){
        final barn = snapshot.data ?? List();
        return ListView.builder(
            itemCount: barn.length,
            itemBuilder: (_, index){
              final itembarn = barn[index];
              print(itembarn);
              print(itembarn.sitename);
              print(args.sitename);
              print(args.numofbarn);
//              if(itembarn == null)
//                return Container();
              return _ListDetail(itembarn , database.db);
            });
      },
    );
  }
  Widget _ListDetail (SetupBarn barn, MyData data){
    final database = Provider.of<SetupBarnDao>(context);
    final now = new DateTime.now();
    final formatter = new DateFormat();
    return GestureDetector(
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Stack(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset("assets/item_card.png"),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(barn.barnname,style:
                          TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text("Updated: "+ barn.Updated.toString(),style:
                            TextStyle(
                                color: Colors.grey
                            ),),
                          ),
                          Row(
                            children: <Widget>[
                              Text("Count ",style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(barn.numofbarn.toString(),style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
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
  Widget _buildPopupMenu() {
    return PopupMenuButton<int>(
      icon: Icon(Icons.more_vert, color: Colors.white,),
      onSelected: (int result) {

      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        const PopupMenuItem<int>(
          value: 2,
          child: Text('delete'),
        ),
      ],
    );
  }
}