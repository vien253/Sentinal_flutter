import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget{
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

          )
        ],

      ),
    );
  }
}