import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MainDrawer extends StatefulWidget{
  _MainDrawer createState() => _MainDrawer();

}
class _MainDrawer extends State<MainDrawer>{
  SharedPreferences logindata;
  String username;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username');
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/logo_drawer.png'),
                    Text('version 0.0.3'),
                  ],
                ),
              ),
            ),
          ),
          ListTile(

          ),
//          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 480, 0, 0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FlatButton(
                onPressed: (){
                  logindata.setBool('login', true);
                  Navigator.pushNamed(context, '/');
                },
                child: Text("Sign Out",style:
                TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.bold
                ),),
              ),
            ),
          ),
        ],

      ),
    );
  }
}