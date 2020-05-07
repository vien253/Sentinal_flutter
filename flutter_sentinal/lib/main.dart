import 'site_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sentinal/home.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.grey[100]
      ),
      initialRoute: '/',
      routes: {
        '/home': (context) => Home(),
        '/': (context)=> LoginPage(),
        '/siteDetail': (context) => SiteDetail(),
      },
//      theme: ThemeData(
//        primaryColor: Colors.grey[100],
//      ),
//      home: LoginPage(),
    );
  }

  Widget gotohome (BuildContext context){
    return Home();
  }
}
class LoginPage extends StatefulWidget{
  @override
  _LoginPage createState() => _LoginPage();
}
class _LoginPage extends State<LoginPage>{
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  FocusNode _userFNode =FocusNode();
  FocusNode _passFNode = FocusNode();
  var _userErr = 'Tài khoản không hợn lệ';
  var _passErr = 'Mật khẩu lớn hơn 6 kí tự';
  bool _checkUser = false;
  bool _checkPass = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//        backgroundColor: Colors.indigo[900],
          backgroundColor: Color(0xff002057),
//        resizeToAvoidBottomInset: false, //cố định các phần tử trong giao diện
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 80, 0, 70),
                    child: Container(
                      child: Image.asset('assets/logo.png'),
                    ),
                  ),
//                Spacer(flex: 2),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: Container(
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                      ),
                      width: double.maxFinite,

                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0,10),
                            child: Text('Welcome back',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 30,
                              ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0,40),
                            child: Text('Login to your account',
                              style: TextStyle(
                                color: Colors.black26,
                                fontSize: 15,
                              ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                            child: TextField(
                              focusNode: _userFNode,
                              onEditingComplete: (){
                                FocusScope.of(context).requestFocus(_passFNode);
                              },
                              controller: _userController,
                              decoration: new InputDecoration(
                                errorText: _checkUser== true ? _userErr:null,
                                  fillColor: Colors.black12,filled: true,
                                  hintText: 'Email'
                              ),

                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 50),
                            child: TextField(
                              focusNode: _passFNode,
                              onSubmitted:(_) => FocusScope.of(context).unfocus(),
                              obscureText: true,
                              controller: _passController,
                              decoration: new InputDecoration(
                                errorText: _checkPass== true ? _passErr:null,
                                  fillColor: Colors.black12,filled: true,
                                  hintText: 'Password'
                              ),

//                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 60),
                            child: Container(
                              decoration: new BoxDecoration(
                                color: Colors.blue[800],
                                borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                              ),
                              width: double.maxFinite,
                              child: FlatButton(
                                onPressed: onLogin,
                                child: Text('Sign In',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white
                                  ),),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                            child: Container(
                              child: Text('Forgot your password?',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black
                                ),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
//                Spacer(flex: 3,),

                ],
              ),
            ),
          ),
        ),
      );

  }

  void onLogin() {
    setState(() {
      if(_userController.text.length < 6 || !_userController.text.contains('@'))
        _checkUser = true;
      else _checkUser = false;
      if(_passController.text.length<6)
        _checkPass = true;
      else _checkPass= false;

      print(_checkPass);
      print(_checkUser);
      if(_checkPass== false && _checkUser== false) {
        Navigator.pushNamed(context, '/home');
      }
    });
  }
}
