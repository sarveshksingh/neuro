import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neurosms/models/Login.dart';
import 'package:neurosms/retrofit/api_client.dart';
import 'package:neurosms/routes/Routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import '../GetPasswordScreen.dart';

/*class EmailFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Email can\'t be empty' : null;
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Password can\'t be empty' : null;
  }
}*/

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({this.onSignedIn});

  final VoidCallback onSignedIn;

  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

/*enum FormType {
  login,
  register,
}*/

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _username, _password, imgPath = '';

  bool visible = true;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      imgPath = (prefs.getString('msologo') ?? null);
    });
  }

  loadProgress() {
    if (visible == true) {
      setState(() {
        visible = false;
      });
    } else {
      setState(() {
        visible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.redAccent,
        /*appBar: AppBar(
        title: Text("Login Page"),
      ),*/
        //body:
        /*SingleChildScrollView(
            child:*/
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Group7534.png"),
                fit: BoxFit.cover,
              ),
              //color: Colors.transparent
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                      child: Container(
                          child: Padding(
                    padding: const EdgeInsets.only(top: 120.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 200,
                        height: 100,
                        /*child: Text(
                          'NEUROSMS',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                        ),*/
                        decoration: BoxDecoration(
                          //color: Colors.red,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              //image: AssetImage('assets/images/bank.png')
                              //image: SvgPicture.asset('assets/images/bank.svg')
                              image: NetworkImage(imgPath)),
                          //borderRadius: BorderRadius.circular(50.0)
                        ),
                        //child: Image.asset('assets/images/bank.png')
                      ),
                    ),
                  ))),
                  Expanded(
                      child: Container(
                          child: Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    margin: EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                            child: new Form(
                                key: formKey,
                                child: new Column(
                                  children: <Widget>[
                                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                                    Padding(
                                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                                      padding: EdgeInsets.only(
                                          left: 15.0,
                                          right: 15.0,
                                          top: 32.0,
                                          bottom: 0),
                                      child: TextFormField(
                                        onSaved: (val) => _username = val,
                                        validator: (value) {
                                          if (value.trim().isEmpty) {
                                            return 'Please enter your email address';
                                          }
                                          // Check if the entered email has the right format
                                          /*if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                      return 'Please enter a valid email address';
                                    }*/
                                          // Return null if the entered email is valid
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            //border: OutlineInputBorder(),
                                            prefixIcon: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                          .only(
                                                      start: 16.0,
                                                      end: 16.0,
                                                      top: 8.0),
                                              child: SvgPicture.asset(
                                                  'assets/images/user.svg',
                                                  color: Color(
                                                      0xffDF1D3B)), // myIcon is a 48px-wide widget.
                                            ),
                                            suffixIcon: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                          .only(
                                                      start: 16.0,
                                                      end: 16.0,
                                                      top: 8.0),
                                              child: SvgPicture.asset(
                                                  'assets/images/tick.svg',
                                                  color: Color(
                                                      0xffDF1D3B)), // myIcon is a 48px-wide widget.
                                            ),
                                            labelText: 'Email',
                                            hintText:
                                                'Enter valid email id as abc@gmail.com'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0,
                                          right: 15.0,
                                          top: 15.0,
                                          bottom: 0),
                                      //padding: EdgeInsets.symmetric(horizontal: 15),
                                      child: TextFormField(
                                        obscureText: true,
                                        onSaved: (val) => _password = val,
                                        validator: (value) {
                                          if (value.trim().isEmpty) {
                                            return 'This field is required';
                                          }
                                          if (value.trim().length < 8) {
                                            return 'Password must be at least 8 characters in length';
                                          }
                                          // Return null if the entered password is valid
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            //border: OutlineInputBorder(),
                                            prefixIcon: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                          .only(
                                                      start: 16.0,
                                                      end: 16.0,
                                                      top: 8.0),
                                              child: SvgPicture.asset(
                                                  'assets/images/lock.svg',
                                                  color: Color(
                                                      0xffDF1D3B)), // myIcon is a 48px-wide widget.
                                            ),
                                            suffixIcon: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                          .only(
                                                      start: 16.0,
                                                      end: 16.0,
                                                      top: 8.0),
                                              child: SvgPicture.asset(
                                                  'assets/images/visibility.svg',
                                                  color: Color(
                                                      0xffDF1D3B)), // myIcon is a 48px-wide widget.
                                            ),
                                            labelText: 'Password',
                                            hintText: 'Enter secure password'),
                                      ),
                                    ),
                                    FlatButton(
                                        onPressed: () {
                                          //TODO FORGOT PASSWORD SCREEN GOES HERE
                                          /*Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        Routes.forgot,
                                        ModalRoute.withName(Routes.forgot));*/
                                          // Navigator.pushNamedAndRemoveUntil(
                                          //     context, Routes.forget, ModalRoute.withName(Routes.forget));
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      GetPasswordScreen()));
                                        },
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'Forgot Password?',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                decoration:
                                                    TextDecoration.underline),
                                          ),
                                        )),
                                    Expanded(
                                        child: Center(
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 15.0, right: 15.0),
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: new Column(
                                                    //mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: <Widget>[
                                                      Container(
                                                        child: FlatButton(
                                                          onPressed: () {
                                                            /*Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            HomeScreen()));*/
                                                            loadProgress();
                                                            final form = formKey
                                                                .currentState;

                                                            if (form
                                                                .validate()) {
                                                              setState(() =>
                                                                  _isLoading =
                                                                      true);
                                                              form.save();
                                                              _buildBody(
                                                                  context,
                                                                  _username,
                                                                  _password);
                                                              // Navigator.pushNamedAndRemoveUntil(
                                                              //     context, Routes.login, ModalRoute.withName(Routes.login));
                                                            }
                                                          },
                                                          child: Text(
                                                            'LOG IN',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16),
                                                          ),
                                                        ),
                                                      )
                                                    ]))))
                                  ],
                                ))),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 25.0),
                              child: Text(
                                  'NEURO SMS 2021 Copyright Neuro Informstics Pvt. Ltd'),
                            ))
                      ],
                    ),
                  ))),
                  /*Container(
                  child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 150.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Text(
                      'NEUROSMS',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                    */ /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/ /*
                    //child: Image.asset('asset/images/flutter-logo.png')
                  ),
                ),
              )),
              Container(
                  child: Card(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      margin: EdgeInsets.only(top: 10.0),
                      child: new Form(
                          key: formKey,
                          child: new Column(
                            children: <Widget>[
                              Padding(
                                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                                padding: EdgeInsets.only(
                                    left: 15.0,
                                    right: 15.0,
                                    top: 32.0,
                                    bottom: 0),
                                child: TextFormField(
                                  onSaved: (val) => _username = val,
                                  validator: (value) {
                                    if (value.trim().isEmpty) {
                                      return 'Please enter your email address';
                                    }
                                    // Check if the entered email has the right format
                                    */ /*if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                      return 'Please enter a valid email address';
                                    }*/ /*
                                    // Return null if the entered email is valid
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      //border: OutlineInputBorder(),
                                      labelText: 'Email',
                                      hintText:
                                          'Enter valid email id as abc@gmail.com'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0,
                                    right: 15.0,
                                    top: 15,
                                    bottom: 0),
                                //padding: EdgeInsets.symmetric(horizontal: 15),
                                child: TextFormField(
                                  obscureText: true,
                                  onSaved: (val) => _password = val,
                                  validator: (value) {
                                    if (value.trim().isEmpty) {
                                      return 'This field is required';
                                    }
                                    if (value.trim().length < 8) {
                                      return 'Password must be at least 8 characters in length';
                                    }
                                    // Return null if the entered password is valid
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      //border: OutlineInputBorder(),
                                      labelText: 'Password',
                                      hintText: 'Enter secure password'),
                                ),
                              ),
                              FlatButton(
                                  onPressed: () {
                                    //TODO FORGOT PASSWORD SCREEN GOES HERE
                                    */ /*Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        Routes.forgot,
                                        ModalRoute.withName(Routes.forgot));*/ /*
                                    // Navigator.pushNamedAndRemoveUntil(
                                    //     context, Routes.forget, ModalRoute.withName(Routes.forget));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                GetPasswordScreen()));
                                  },
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          decoration: TextDecoration.underline),
                                    ),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(
                                      top: 50.0, left: 15.0, right: 15.0),
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: new Column(
                                      //mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Container(
                                          child: FlatButton(
                                            onPressed: () {
                                              */ /*Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          HomeScreen()));*/ /*
                                              loadProgress();
                                              final form = formKey.currentState;

                                              if (form.validate()) {
                                                setState(
                                                    () => _isLoading = true);
                                                form.save();
                                                _buildBody(context, _username,
                                                    _password);
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (_) =>
                                                //             HomeScreen()));
                                              }
                                            },
                                            child: Text(
                                              'LOG IN',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        )
                                      ])),
                              SizedBox(
                                height: 130,
                              ),
                              Text(
                                  'NEURO SMS 2021 Copyright Neuro Informstics Pvt. Ltd')
                            ],
                          )))),*/
                ])));
  }

  FutureBuilder<Login> _buildBody(
      BuildContext context, String username, String password) {
    final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<Login>(
      future: client.loginUser(username, password).then((respose) {
        setState(() => _isLoading = false);
        setState(() async {
          if (respose.status == 1) {
            loadProgress();
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.setBool('Login', true);
            pref.setString('token', respose.tokenId);
            /*pref.setString("Branch", respose.Branch);
            pref.setString("Name", respose.Name);
            pref.setString("Image_Path", respose.Image_Path);
            pref.setString("User_ID", respose.User_ID);
            pref.setString("Deligated_ByName", respose.Deligated_ByName);
            pref.setString("Deligated_By", respose.Deligated_By);
            pref.setString("Department", respose.Department);
            pref.setString("M_app_key", respose.M_App_Key);*/
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.home, ModalRoute.withName(Routes.home));
            //return _buildPosts(context, respose);
          } else
          /*if (respose.Error_Code == "400")*/ {
            Toast.show("Oops something went wrong", context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
          }
        });
      }).catchError((err) {
        print(err);
      }),
    );
  }
}
