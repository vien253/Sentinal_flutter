import 'package:flutter/material.dart';
import 'package:flutter_sentinal/drawer.dart';
import 'add_site.dart';
import 'site_detail.dart';

void main() => runApp(Home());
final _listLeading =<String>["assets/item_card.png","assets/item_card.png","assets/item_card.png","assets/item_card.png","assets/item_card.png","assets/item_card.png","assets/item_card.png","assets/item_card.png","assets/item_card.png","assets/item_card.png"];
final _listTitle = <String>["s","a","fsdf","ầ","assets/item_card.png","assets/item_card.png",'đasđâs',"dáhdkád","áđâsdgaigai","hương big"];
final _listSubtitle = <String>["s","a","fsdf","ầ","adsáđâsđá","sfdsdfsdfdsf","sfdsdfsdfdsf","sfdsdfsdfdsf","sfdsdfsdfdsf","sfdsdfsdfdsf"];
final _listNum = <int>[1,2,2,3,4,5,6,8,9,9];
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: ListView.builder(
            itemCount: _listTitle.length,
            itemBuilder: (context,index){
//            return ListHome(_listLeading[index],_listTitle[index],_listSubtitle[index]);
            return ListHome2(_listLeading[index], _listTitle[index], _listSubtitle[index], _listNum[index]);
        }),
      ),
    );
  }
  Widget ListHome (String leading,String title, String subtitle){
    return Card(
      child: ListTile(
        onTap: (){
          Navigator.pushNamed(context, '/siteDetail');
        },
        leading: Image.asset(leading),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.navigate_next),
      ),
    );
  }
  Widget ListHome2 (String leading,String title, String subtitle, int num){
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/siteDetail');
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Stack(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(leading),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(title,style:
                          TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Text("Updated: $subtitle",style:
                            TextStyle(
                              color: Colors.grey
                            ),),
                        ),
                        Row(
                          children: <Widget>[
                            Text("Count ",style: TextStyle(fontWeight: FontWeight.bold),),
                            Text(num.toString(),style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
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
    );
  }
}