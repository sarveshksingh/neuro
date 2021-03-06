import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:neurosms/models/BaseModel.dart';
import 'package:neurosms/models/ServerError.dart';
import 'package:neurosms/models/SubscriptionModel.dart';
import 'package:neurosms/models/NewProductInfoObj.dart';
import 'package:neurosms/models/SubscriptionRechargeCalculationObj.dart';
import 'package:neurosms/models/SubscriptionRequestModel.dart';
import 'package:neurosms/retrofit/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Common.dart';

class Subscription extends StatefulWidget {
  static const String routeName = '/subscription';

  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  var checkBoxValue;
  String _token, _subsId, _encdvcId;
  double walletBalance = 0.0;
  final List<String> entries = <String>['A', 'B', 'C'];
  List<MostRecentSubscriptionList> mostRecentSubscriptionList = [];
  List<PackageList> packageList = [],
      addOnPackageList = [],
      selectedPackageList = [],
      selectedAddOnPackageList = [];
  List<ChannelList> channelList = [], selectedChannelList = [];

  @override
  Widget build(BuildContext context) {
    List<String> listItem = ["Delegate", "Visitor", "Contacts", "Home"];
    return MaterialApp(
      // title: 'My Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          title: Text(
            'Subscription',
            //textDirection: TextDirection.ltr,
            style: TextStyle(color: Color(0xffFFFFFF)),
          ),
          backgroundColor: Color(0xffDF1D3B),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            SizedBox(height: 12.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                color: Colors.transparent,
                margin: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "MOST RECENT SUBSCRIPTION",
                  style: TextStyle(fontSize: 15, color: Color(0xff333333)),
                  //textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            /*Container(
              height: 250,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: ListView.builder(
                          itemCount: listItem.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            //return new Text(listItem[index]);
                            int ind = index;
                            return GestureDetector(
                              onTap: () {
                                print("index $ind");
                                // showCustomModelBottomSheetChannel();
                              },
                              child: Card(
                                child: Row(
                                  children: [
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 25.0,
                                              top: 20.0,
                                              bottom: 20.0),
                                          child: Row(children: [
                                            Container(
                                              child: Icon(Icons.network_cell),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            // Container(
                                            //   child: Text('Hello'),
                                            // )
                                          ]),
                                        ),
                                      ],
                                    ),

                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        */ /* ListTile(
                leading: Icon(Icons.wifi),
                title: Text(listItem[index],style: TextStyle(fontSize: 18,color: Colors.grey),),

              ),*/ /*
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 15.0, top: 20.0),
                                          child: Row(children: [
                                            // Container(
                                            //   child: Icon(Icons.network_cell),
                                            // ),
                                            // SizedBox(width: 10,),
                                            Container(
                                              child: Text('Basic'),
                                            )
                                          ]),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 15.0, top: 5),
                                          child: Row(children: [
                                            // Container(
                                            //   child: Icon(Icons.network_cell),
                                            //
                                            // ),
                                            //SizedBox(width: 10),
                                            Container(
                                              child: Text(
                                                'Active',
                                                style: TextStyle(
                                                    color: Color(0xff227700)),
                                              ),
                                            )
                                          ]),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 15.0, top: 5, bottom: 20),
                                          child: Row(children: [
                                            // Container(
                                            //   child: Icon(Icons.network_cell),
                                            //
                                            // ),
                                            //SizedBox(width: 10),
                                            Container(
                                              child: Text('6 sep 2021'),
                                            )
                                          ]),
                                        ),
                                      ],
                                    ),

                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 5.0,
                                              top: 20.0,
                                              bottom: 20.0),
                                          child: Row(children: [
                                            // Container(
                                            //   child: Icon(Icons.network_cell),
                                            // ),
                                            // SizedBox(width: 20,),
                                            Container(
                                              child: Text('20 Days Ago'),
                                            )
                                          ]),
                                        ),
                                      ],
                                    ),

                                    // For Second Column
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 50.0, top: 20.0),
                                          child: Row(children: [
                                            // Container(
                                            //   child: Icon(Icons.network_cell),
                                            //
                                            // ),
                                            // SizedBox(width: 10),
                                            Container(
                                              child: Text('Rs 222.45'),
                                            )
                                          ]),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 50.0, top: 5.0),
                                          child: Row(children: [
                                            // Container(
                                            //   child: Icon(Icons.network_cell),
                                            //   // child: Checkbox(
                                            //   //
                                            //   //   activeColor: Colors.green,
                                            //   // ),
                                            //
                                            // ),
                                            // SizedBox(width: 10),
                                            Container(
                                              child: Text('19 oct 2021'),
                                            )
                                          ]),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                color: Colors.white,
                                shadowColor: Colors.lightBlue,
                                elevation: 5.0,
                                //margin: EdgeInsets.all(15.0),
                                margin: EdgeInsets.only(
                                    left: 15.0,
                                    right: 15.0,
                                    top: 5.0,
                                    bottom: 5.0),
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),*/
            LimitedBox(
                maxHeight: 135,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Flexible(
                      child: _mostRescentSubscriptionListView(
                          context, mostRecentSubscriptionList))
                ])),
            Container(
              //height: 490.0,
              margin: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 5.0, bottom: 15.0),
              decoration: BoxDecoration(
                /*
                border: Border.all(
                  color: Color(0xFFF05A22),
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                 */

                color: Color(0xffFFEFEE),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin:
                        EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0),
                    //height: 180.0,
                    color: Color(0xffFFEFEE),
                    //color: Colors.red,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            color: Colors.transparent,
                            margin: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              "ADD / RECHARGE SUBSCRIPTION",
                              style: TextStyle(
                                  fontSize: 15, color: Color(0xff333333)),
                              //textDirection: TextDirection.ltr,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        SizedBox(
                          //width: 350,
                          child: FlatButton(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "Basic Package",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Open_Sans_Regular'),
                                )),
                                // SizedBox(
                                //   width: 207.0,
                                // ),
                                Image.asset(
                                  'assets/images/pluse.png',
                                  width: 20.0,
                                  height: 20.0,
                                )
                              ],
                            ),
                            onPressed: () {
                              print('Basic package tapped');
                              //showCustomModelBottomSheetChannel();
                              showCustomModelBottomSheetBasicPackage(
                                  context, packageList);
                            },
                            textColor: Color(0xffFFFFFF),
                            color: Color(0xFFE02935),
                            shape: OutlineInputBorder(
                                borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                    color: Colors.transparent),
                                borderRadius: new BorderRadius.circular(15.0)),
                          ),
                        ),
                        LimitedBox(
                            maxHeight: 135,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                      child: _basicSubscriptionList(
                                          context, selectedPackageList)
                                      // child: _mostRescentSubscriptionListView(
                                      //     context, mostRecentSubscriptionList)
                                  )
                                ])),
                        SizedBox(width: 1),
                        SizedBox(
                          //width: 350,
                          child: FlatButton(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "Add On Package",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Open_Sans_Regular'),
                                )),
                                /*SizedBox(
                                  width: 193.0,
                                ),*/
                                Image.asset(
                                  'assets/images/pluse.png',
                                  width: 20.0,
                                  height: 20.0,
                                )
                              ],
                            ),
                            onPressed: () {
                              print('Add On package tapped');
                              //showCustomModelBottomSheetChannel();
                              showCustomModelBottomSheetAddOnPackage(
                                  context, addOnPackageList);
                            },
                            textColor: Color(0xffFFFFFF),
                            color: Color(0xFFE02935),
                            shape: OutlineInputBorder(
                                borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                    color: Colors.transparent),
                                borderRadius: new BorderRadius.circular(15.0)),
                          ),
                        ),
                        LimitedBox(
                            maxHeight: 135,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                      child: _addOnSubscriptionList(
                                          context, selectedAddOnPackageList))
                                ])),
                        SizedBox(width: 1),
                        SizedBox(
                          //width: 350,
                          child: FlatButton(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "A-LA Carte",
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      fontFamily: "Open_Sans_Regular"),
                                )),
                                /*SizedBox(
                                  width: 228.0,
                                ),*/
                                Image.asset(
                                  'assets/images/pluse.png',
                                  width: 20.0,
                                  height: 20.0,
                                )
                              ],
                            ),
                            onPressed: () {
                              print('A-LA Carte package tapped');
                              // showCustomModelBottomSheetChannel();
                              showCustomModelBottomSheetChannelList(
                                  context, channelList);
                            },
                            textColor: Color(0xffFFFFFF),
                            color: Color(0xFFE02935),
                            shape: OutlineInputBorder(
                                borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                    color: Colors.transparent),
                                borderRadius: new BorderRadius.circular(15.0)),
                          ),
                        ),
                        LimitedBox(
                            maxHeight: 135,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                      child: _aLaCarteSubscriptionList(
                                          context, selectedChannelList))
                                ])),
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                    height: 295.0,
                    decoration: BoxDecoration(
                      /*
                       border: Border.all(
                       color: Color(0xFFF05A22),
                        style: BorderStyle.solid,
                        width: 1.0,
                       ),
                       */

                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          //width: 300,
                          margin:
                              EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                          height: 30,
                          color: Color(0xffFBFBFB),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Sub Total",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: "Open_Sans_Regular",
                                    color: Color(0xff333333)),
                              ),
                              SizedBox(
                                  //width: 220.0,
                                  ),
                              Text(
                                '\u{20B9} ${0.00}',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: "Open_Sans_Regular",
                                    color: Color(0xff333333)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          //width: 300,
                          margin:
                              EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                          height: 30,
                          color: Color(0xffFBFBFB),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "CGST (9.00%)",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: "Open_Sans_Regular",
                                    color: Color(0xff333333)),
                              ),
                              SizedBox(
                                  //width: 220.0,
                                  ),
                              Text(
                                '\u{20B9} ${0.00}',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: "Open_Sans_Regular",
                                    color: Color(0xff333333)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          //width: 300,
                          margin:
                              EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                          height: 30,
                          color: Color(0xffFBFBFB),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "SGST (9.00%)",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: "Open_Sans_Regular",
                                    color: Color(0xff333333)),
                              ),
                              SizedBox(
                                  //width: 220.0,
                                  ),
                              Text(
                                '\u{20B9} ${0.00}',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: "Open_Sans_Regular",
                                    color: Color(0xff333333)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          //width: 300,
                          margin:
                              EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                          height: 30,
                          color: Color(0xffFBFBFB),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Refund",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: "Open_Sans_Regular",
                                    color: Color(0xff333333)),
                              ),
                              SizedBox(
                                  //width: 220.0,
                                  ),
                              Text(
                                '\u{20B9} ${0.00}',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: "Open_Sans_Regular",
                                    color: Color(0xff333333)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          //width: 300,
                          margin:
                              EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                          height: 30,
                          color: Color(0xffDADADA),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: "Open_Sans_Regular",
                                    color: Color(0xff333333)),
                              ),
                              SizedBox(
                                  //width: 220.0,
                                  ),
                              Text(
                                '\u{20B9} ${0.00}',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: "Open_Sans_Regular",
                                    color: Color(0xff333333)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          //width: 300,
                          margin:
                              EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                          height: 30,
                          color: Color(0xffFBFBFB),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Wallet Balance",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: "Open_Sans_Regular",
                                    color: Color(0xff333333)),
                              ),
                              SizedBox(
                                  //width: 220.0,
                                  ),
                              Text(
                                '\u{20B9} ${151.00}',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: "Open_Sans_Regular",
                                    color: Color(0xff333333)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          //width: 300,
                          margin:
                              EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                          height: 30,
                          color: Color(0xffDADADA),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Net Payable Amount",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: "Open_Sans_Regular",
                                    color: Color(0xff333333)),
                              ),
                              SizedBox(
                                  //width: 220.0,
                                  ),
                              Text(
                                '\u{20B9} ${0.00}',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: "Open_Sans_Regular",
                                    color: Color(0xff333333)),
                              ),
                            ],
                          ),
                        ),
/*


*/
                        Container(
                          margin: EdgeInsets.only(left: 5.0),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 100,
                                child: FlatButton(
                                  child: Column(
                                    children: [
                                      Text(
                                        "SUBMIT",
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontFamily: "Open_Sans_Regular"),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    print('Submit button Clicked');
                                    //Navigator.pop(context);
                                  },
                                  textColor: Color(0xffFFFFFF),
                                  color: Color(0xffDF193E),
                                  shape: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          width: 1.0,
                                          color: Colors.transparent),
                                      borderRadius:
                                          new BorderRadius.circular(15.0)),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              SizedBox(
                                width: 100,
                                child: FlatButton(
                                  child: Column(
                                    children: [
                                      Text(
                                        "CANCEL",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontFamily: "Open_Sans_Regular",
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    print('Submit button Clicked');
                                    //Navigator.pop(context);
                                  },
                                  textColor: Color(0xffFFFFFF),
                                  color: Color(0xff727272),
                                  shape: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          width: 1.0,
                                          color: Colors.transparent),
                                      borderRadius:
                                          new BorderRadius.circular(15.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = (prefs.getString('token') ?? null);
    _subsId = (prefs.getString('subsId') ?? null);
    _encdvcId = (prefs.getString('encDvcMapId') ?? '');
    walletBalance = (prefs.getDouble('balance') ?? 0.0);

    var subscriptionRequest = SubscriptionRequestModel();

    List<dynamic> packageList = [];
    List<dynamic> channelList = [];
    List<dynamic> taxList = [];
    List<dynamic> mostRecentSubscriptionList = [];

    var productInfoObject = Obj();
    var subscriptionRechargeCalculationObj = Obj();

    subscriptionRequest.tokenId = _token;
    subscriptionRequest.subsId = _subsId;
    subscriptionRequest.encdvcId = _encdvcId;
    subscriptionRequest.packageList = packageList;
    subscriptionRequest.channelList = channelList;
    subscriptionRequest.taxList = taxList;
    subscriptionRequest.mostRecentSubscriptionList = mostRecentSubscriptionList;
    subscriptionRequest.newProductInfoObj = productInfoObject;
    subscriptionRequest.subscriptionRechargeCalculationObj =
        subscriptionRechargeCalculationObj;
    subscriptionRequest.pageName = "recharge";

    if (_token != null) {
      _buildBody(context, subscriptionRequest);
    }
  }

  Future<BaseModel<SubscriptionModel>> _buildBody(BuildContext context,
      SubscriptionRequestModel subscriptionRequest) async {
    SubscriptionModel response;
    final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
    try {
      Common().showAlertDialog(context);
      response =
          await client.getSubscriptionData(json.encode(subscriptionRequest));
      Navigator.pop(context);
      setState(() {
        if (response.status == 1) {
          mostRecentSubscriptionList =
              response.manualSubsObj.mostRecentSubscriptionList;
          packageList = response.manualSubsObj.basicpackageList;
          addOnPackageList = response.manualSubsObj.addOnpackageList;
          channelList = response.manualSubsObj.channelList;
          _mostRescentSubscriptionListView(context, mostRecentSubscriptionList);
        }
      });
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      Navigator.pop(context);
      //_logoutPressed();
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  Widget _mostRescentSubscriptionListView(
      BuildContext context, List<MostRecentSubscriptionList> mostRecentList) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: mostRecentList.length,
        itemBuilder: (BuildContext ctx, int index) {
          //return new Text(listItem[index]);

          String productName = mostRecentList.elementAt(index).productName;
          String subscriptionTypeName =
              mostRecentList.elementAt(index).subscriptionTypeName;
          bool status = mostRecentList.elementAt(index).isActive;
          String statusValue = '';
          double amount = mostRecentList.elementAt(index).monthlyPrice;
          // String expiryDay = mostRecentList.elementAt(index).daysLeft as String;
          // double amount = mostRecentList.elementAt(index).price;
          // String startDate = mostRecentList.elementAt(index).startDate as String;
          // String endDate = mostRecentList.elementAt(index).endDate as String;
          DateTime startDate =
              DateTime.parse(mostRecentList.elementAt(index).startDate);
          DateTime endDate =
              DateTime.parse(mostRecentList.elementAt(index).endDate);
          DateTime now = DateTime.now();

          String startFormattedDate =
              DateFormat('dd-MMM-yyyy').format(startDate);
          String enddtFormattedDate = DateFormat('dd-MMM-yyyy').format(endDate);
          // final difference = endDate.difference(now).inDays;
          // String expire = 'Expires in ' + difference.toString() + ' days';
          bool isActive = mostRecentList.elementAt(index).isActive;
          String alert = isActive ? 'Active' : 'In Active';

          if (status) {
            statusValue = "Active";
          } else {
            statusValue = "InActive";
          }

          int ind = index;
          return new Card(
            child: Column(
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
                        child: Row(children: [
                          Container(
                            child: Icon(Icons.network_cell),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          // Container(
                          //   child: Text('Hello'),
                          // )
                        ]),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 15.0, top: 5.0),
                            child: Row(children: [
                              Container(
                                child: Text(
                                  productName,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff333333),
                                      fontFamily: 'Roboto_Medium'),
                                  //textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.left,
                                ),
                              )
                            ]),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15.0, top: 5),
                            child: Row(children: [
                              Expanded(
                                child: Text(
                                  statusValue,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: statusValue == 'Active'
                                          ? Color(0xff227700)
                                          : Color(0xffDF1D3B),
                                      fontFamily: 'Roboto_Regular'),
                                  // textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10.0),
                                child: Text(
                                  '\u{20B9} ${amount}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff333333),
                                      fontFamily: 'Roboto_Regular'),
                                  // textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.left,
                                ),
                              )
                            ]),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 15.0, top: 5, bottom: 5),
                            child: Row(children: [
                              Expanded(
                                child: Text(
                                  startFormattedDate,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff333333),
                                      fontFamily: 'Roboto_Regular'),
                                  //textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10.0),
                                child: Text(
                                  enddtFormattedDate,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff333333),
                                      fontFamily: 'Roboto_Regular'),
                                  //textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.left,
                                ),
                              )
                            ]),
                          ),
                        ],
                      )),
                    ],
                  )
                ]),

            color: Colors.white,
            shadowColor: Colors.lightBlue,
            elevation: 5.0,
            //margin: EdgeInsets.all(15.0),
            margin:
                EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
          );
        });
  }

  void showCustomModelBottomSheetChannel() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          //the rounded corner is created here.
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60.0), topRight: Radius.circular(60.0)),
        ),
        context: context,
        builder: (context) {
          return Container(
            margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30.0, left: 10.0),
                  //color: Colors.red,
                  child: Text(
                    'CHANNEL LIST',
                    style: TextStyle(color: Color(0xff333333)),
                  ),
                ),
                SizedBox(height: 5),
                ListView.builder(
                  padding: EdgeInsets.only(top: 5),
                  physics: NeverScrollableScrollPhysics(),

                  ///
                  shrinkWrap: true,

                  ///
                  scrollDirection: Axis.vertical,

                  ///
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) => Card(
                    child: Column(
                      children: <Widget>[
                        // //Image.asset('assets/images/pluse.jpg'),
                        // Text('hello')
                        ListTile(
                          trailing: new Icon(Icons.photo),
                          title: new Text('Photo'),
                          onTap: () {
                            // Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0, left: 40),
                      // width: 50,
                      //color: Colors.red,
                      child: FlatButton(
                        child: Row(
                          children: [
                            Text(
                              "REMOVE",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "Open_Sans_Regular"),
                            ),
                            // SizedBox(
                            //   //width: 207.0,
                            // ),
                            // Image.asset(
                            //   'assets/images/pluse.png',
                            //   width: 20.0,
                            //   height: 20.0,
                            // )
                          ],
                        ),
                        onPressed: () {
                          print('Remove button tapped');
                        },
                        textColor: Color(0xffF9F9FB),
                        color: Color(0xffDF193E),
                        shape: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                width: 1.0,
                                color: Colors.transparent),
                            borderRadius: new BorderRadius.circular(15.0)),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0, right: 50),
                      //width: 30,
                      //color: Colors.green,
                      child: FlatButton(
                        child: Row(
                          children: [
                            Text(
                              "CANCEL",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "Open_Sans_Regular"),
                            ),
                            // SizedBox(
                            //  // width: 207.0,
                            // ),
                            // Image.asset(
                            //   'assets/images/pluse.png',
                            //   width: 20.0,
                            //   height: 20.0,
                            // )
                          ],
                        ),
                        onPressed: () {
                          print('Cancel button tapped');
                        },

                        // textColor: Color(0xF9F9FB),
                        textColor: Color(0xffF9F9FB),

                        color: Color(0xff727272),
                        shape: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                width: 1.0,
                                color: Colors.transparent),
                            borderRadius: new BorderRadius.circular(15.0)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  void showCustomModelBottomSheetBasicPackage(
      BuildContext context, List<PackageList> packageList) {
    TextEditingController controller = new TextEditingController();
    /*final List<Map> myProducts =
        List.generate(200, (index) => {"id": index, "name": "Product $index"})
            .toList();*/

    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          //the rounded corner is created here.
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60.0), topRight: Radius.circular(60.0)),
        ),
        context: context,
        builder: (context) {
          return Container(
            //margin: EdgeInsets.only(top: 10.0,bottom: 5.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30.0, left: 10.0),
                  //color: Colors.red,
                  child: Text(
                    'BASICK PACKAGE',
                    style: TextStyle(color: Color(0xff333333)),
                  ),
                ),

                //SizedBox(height: 5),
                Container(
                    margin: EdgeInsets.only(left: 5.0, right: 5.0),
                    color: Colors.white,
                    child: new Padding(
                      padding: EdgeInsets.all(8.0),
                      child: new Card(
                        child: new ListTile(
                          leading: new Icon(Icons.search),
                          title: new TextField(
                            controller: controller,
                            decoration: InputDecoration(
                                hintText: 'Search', border: InputBorder.none),
                            //onChanged: onSearchTextChanged,
                          ),
                          trailing: new IconButton(
                            icon: new Icon(Icons.cancel),
                            onPressed: () {
                              controller.clear();
                              //onSearchTextChanged('');
                            },
                          ),
                        ),
                      ),
                    )),

                Container(
                  height: 300,
                  color: Color(0xFCFCFC),
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: packageList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                            onTap: () {
                          setState(() {
                            // ontap of each card, set the defined int to the grid view index
                            selectedCard = index;
                            selectedPackageList.add(packageList.elementAt(index));
                          });
                        },
                        child: Card(
                        // check if the index is equal to the selected Card integer
                        color: selectedCard == index
                        ? Colors.blue
                            : Colors.amber,
                        child: Container(
                          // alignment: Alignment.topRight,
                          decoration: BoxDecoration(
                            color: Color(0xfffFFFFFF),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff00000029),
                                spreadRadius: 15,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          //child: Text(myProducts[index]["name"]),
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      // child: Text(myProducts[index]["name"]),
                                      child: Text(
                                        //'BASIC WALA',
                                        packageList
                                            .elementAt(index)
                                            .packageName,
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff333333)),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topRight,
                                      height: 50.0,
                                      width: 50.0,
                                      decoration: BoxDecoration(
                                        //color: Colors.red,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/hd.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 30.0, left: 5),

                                    //child: Text(myProducts[index]["name"]),
                                    child: Text(
                                      packageList
                                              .elementAt(index)
                                              .channelCount
                                              .toString() +
                                          ' CHANNELS',
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xff333333)),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 1.0, left: 5),
                                    child: Text(
                                      'Rs ' +
                                          packageList
                                              .elementAt(index)
                                              .packagePrice
                                              .toString() +
                                          ' / MONTH',
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xff333333)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )));
                      }),
                ),

                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 2.0, left: 40),
                      // width: 50,
                      //color: Colors.red,
                      child: FlatButton(
                        child: Row(
                          children: [
                            Text(
                              "REMOVE",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "Open_Sans_Regular"),
                            ),
                            // SizedBox(
                            //   //width: 207.0,
                            // ),
                            // Image.asset(
                            //   'assets/images/pluse.png',
                            //   width: 20.0,
                            //   height: 20.0,
                            // )
                          ],
                        ),
                        onPressed: () {
                          _basicSubscriptionList(context, selectedPackageList);
                          Navigator.pop(context);
                        },
                        textColor: Color(0xffF9F9FB),
                        color: Color(0xffDF193E),
                        shape: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                width: 1.0,
                                color: Colors.transparent),
                            borderRadius: new BorderRadius.circular(15.0)),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      margin: EdgeInsets.only(bottom: 2.0, right: 50),
                      //width: 30,
                      //color: Colors.green,
                      child: FlatButton(
                        child: Row(
                          children: [
                            Text(
                              "CANCEL",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Open_Sans_Regular'),
                            ),
                            // SizedBox(
                            //  // width: 207.0,
                            // ),
                            // Image.asset(
                            //   'assets/images/pluse.png',
                            //   width: 20.0,
                            //   height: 20.0,
                            // )
                          ],
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        // textColor: Color(0xF9F9FB),
                        textColor: Color(0xffF9F9FB),

                        color: Color(0xff727272),
                        shape: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                width: 1.0,
                                color: Colors.transparent),
                            borderRadius: new BorderRadius.circular(15.0)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  int selectedCard = -1;

  void showCustomModelBottomSheetAddOnPackage(
      BuildContext context, List<PackageList> addOnPackageList) {
    TextEditingController controller = new TextEditingController();
    /*final List<Map> myProducts =
        List.generate(200, (index) => {"id": index, "name": "Product $index"})
            .toList();*/

    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          //the rounded corner is created here.
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60.0), topRight: Radius.circular(60.0)),
        ),
        context: context,
        builder: (context) {
          return Container(
            //margin: EdgeInsets.only(top: 10.0,bottom: 5.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30.0, left: 10.0),
                  //color: Colors.red,
                  child: Text(
                    'ADD ON PACKAGE',
                    style: TextStyle(color: Color(0xff333333)),
                  ),
                ),

                //SizedBox(height: 5),
                Container(
                    margin: EdgeInsets.only(left: 5.0, right: 5.0),
                    color: Colors.white,
                    child: new Padding(
                      padding: EdgeInsets.all(8.0),
                      child: new Card(
                        child: new ListTile(
                          leading: new Icon(Icons.search),
                          title: new TextField(
                            controller: controller,
                            decoration: InputDecoration(
                                hintText: 'Search', border: InputBorder.none),
                            //onChanged: onSearchTextChanged,
                          ),
                          trailing: new IconButton(
                            icon: new Icon(Icons.cancel),
                            onPressed: () {
                              controller.clear();
                              //onSearchTextChanged('');
                            },
                          ),
                        ),
                      ),
                    )),

                Container(
                  height: 300,
                  color: Color(0xFCFCFC),
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: addOnPackageList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                // ontap of each card, set the defined int to the grid view index
                                selectedCard = index;
                                selectedAddOnPackageList
                                    .add(addOnPackageList.elementAt(index));
                              });
                            },
                            child: Card(
                                // check if the index is equal to the selected Card integer
                                color: selectedCard == index
                                    ? Colors.blue
                                    : Colors.amber,
                                child: Container(
                                  // alignment: Alignment.topRight,
                                  decoration: BoxDecoration(
                                    color: Color(0xfffFFFFFF),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xff00000029),
                                        spreadRadius: 15,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  //child: Text(myProducts[index]["name"]),
                                  child: Column(
                                    //crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              // child: Text(myProducts[index]["name"]),
                                              child: Text(
                                                //'BASIC WALA',
                                                addOnPackageList
                                                    .elementAt(index)
                                                    .packageName,
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff333333)),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.topRight,
                                              height: 50.0,
                                              width: 50.0,
                                              decoration: BoxDecoration(
                                                //color: Colors.red,
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/hd.png"),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 30.0, left: 5),

                                            //child: Text(myProducts[index]["name"]),
                                            child: Text(
                                              addOnPackageList
                                                      .elementAt(index)
                                                      .channelCount
                                                      .toString() +
                                                  ' CHANNELS',
                                              style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xff333333)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 1.0, left: 5),
                                            child: Text(
                                              'Rs ' +
                                                  addOnPackageList
                                                      .elementAt(index)
                                                      .packagePrice
                                                      .toString() +
                                                  ' / MONTH',
                                              style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xff333333)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )));
                      }),
                ),

                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 2.0, left: 40),
                      // width: 50,
                      //color: Colors.red,
                      child: FlatButton(
                        child: Row(
                          children: [
                            Text(
                              "REMOVE",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "Open_Sans_Regular"),
                            ),
                            // SizedBox(
                            //   //width: 207.0,
                            // ),
                            // Image.asset(
                            //   'assets/images/pluse.png',
                            //   width: 20.0,
                            //   height: 20.0,
                            // )
                          ],
                        ),
                        onPressed: () {
                          _addOnSubscriptionList(
                              context, selectedAddOnPackageList);
                          Navigator.pop(context);
                        },
                        textColor: Color(0xffF9F9FB),
                        color: Color(0xffDF193E),
                        shape: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                width: 1.0,
                                color: Colors.transparent),
                            borderRadius: new BorderRadius.circular(15.0)),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      margin: EdgeInsets.only(bottom: 2.0, right: 50),
                      //width: 30,
                      //color: Colors.green,
                      child: FlatButton(
                        child: Row(
                          children: [
                            Text(
                              "CANCEL",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Open_Sans_Regular'),
                            ),
                            // SizedBox(
                            //  // width: 207.0,
                            // ),
                            // Image.asset(
                            //   'assets/images/pluse.png',
                            //   width: 20.0,
                            //   height: 20.0,
                            // )
                          ],
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        // textColor: Color(0xF9F9FB),
                        textColor: Color(0xffF9F9FB),

                        color: Color(0xff727272),
                        shape: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                width: 1.0,
                                color: Colors.transparent),
                            borderRadius: new BorderRadius.circular(15.0)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  void showCustomModelBottomSheetChannelList(
      BuildContext context, List<ChannelList> channelList) {
    TextEditingController controller = new TextEditingController();
    /*final List<Map> myProducts =
        List.generate(200, (index) => {"id": index, "name": "Product $index"})
            .toList();*/

    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          //the rounded corner is created here.
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60.0), topRight: Radius.circular(60.0)),
        ),
        context: context,
        builder: (context) {
          return Container(
            //margin: EdgeInsets.only(top: 10.0,bottom: 5.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30.0, left: 10.0),
                  //color: Colors.red,
                  child: Text(
                    'A-LA CARTE',
                    style: TextStyle(color: Color(0xff333333)),
                  ),
                ),

                //SizedBox(height: 5),
                Container(
                    margin: EdgeInsets.only(left: 5.0, right: 5.0),
                    color: Colors.white,
                    child: new Padding(
                      padding: EdgeInsets.all(8.0),
                      child: new Card(
                        child: new ListTile(
                          leading: new Icon(Icons.search),
                          title: new TextField(
                            controller: controller,
                            decoration: InputDecoration(
                                hintText: 'Search', border: InputBorder.none),
                            //onChanged: onSearchTextChanged,
                          ),
                          trailing: new IconButton(
                            icon: new Icon(Icons.cancel),
                            onPressed: () {
                              controller.clear();
                              //onSearchTextChanged('');
                            },
                          ),
                        ),
                      ),
                    )),

                Container(
                  height: 300,
                  color: Color(0xFCFCFC),
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: channelList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                // ontap of each card, set the defined int to the grid view index
                                selectedCard = index;
                                selectedChannelList
                                    .add(channelList.elementAt(index));
                              });
                            },
                            child: Card(
                                // check if the index is equal to the selected Card integer
                                color: selectedCard == index
                                    ? Colors.blue
                                    : Colors.amber,
                                child: Container(
                                  // alignment: Alignment.topRight,
                                  decoration: BoxDecoration(
                                    color: Color(0xfffFFFFFF),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0xff00000029),
                                        spreadRadius: 15,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  //child: Text(myProducts[index]["name"]),
                                  child: Column(
                                    //crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              // child: Text(myProducts[index]["name"]),
                                              child: Text(
                                                //'BASIC WALA',
                                                channelList
                                                    .elementAt(index)
                                                    .channelName,
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff333333)),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.topRight,
                                              height: 50.0,
                                              width: 50.0,
                                              decoration: BoxDecoration(
                                                //color: Colors.red,
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/hd.png"),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 30.0, left: 5),

                                            //child: Text(myProducts[index]["name"]),
                                            child: Text(
                                              channelList
                                                  .elementAt(index)
                                                  .channelCatName,
                                              style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xff333333)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 1.0, left: 5),
                                            child: Text(
                                              'Rs ' +
                                                  channelList
                                                      .elementAt(index)
                                                      .channelMonthlyPrice
                                                      .toString() +
                                                  ' / MONTH',
                                              style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xff333333)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )));
                      }),
                ),

                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 2.0, left: 40),
                      // width: 50,
                      //color: Colors.red,
                      child: FlatButton(
                        child: Row(
                          children: [
                            Text(
                              "REMOVE",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "Open_Sans_Regular"),
                            ),
                            // SizedBox(
                            //   //width: 207.0,
                            // ),
                            // Image.asset(
                            //   'assets/images/pluse.png',
                            //   width: 20.0,
                            //   height: 20.0,
                            // )
                          ],
                        ),
                        onPressed: () {
                          _aLaCarteSubscriptionList(
                              context, selectedChannelList);
                          Navigator.pop(context);
                        },
                        textColor: Color(0xffF9F9FB),
                        color: Color(0xffDF193E),
                        shape: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                width: 1.0,
                                color: Colors.transparent),
                            borderRadius: new BorderRadius.circular(15.0)),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      margin: EdgeInsets.only(bottom: 2.0, right: 50),
                      //width: 30,
                      //color: Colors.green,
                      child: FlatButton(
                        child: Row(
                          children: [
                            Text(
                              "CANCEL",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Open_Sans_Regular'),
                            ),
                            // SizedBox(
                            //  // width: 207.0,
                            // ),
                            // Image.asset(
                            //   'assets/images/pluse.png',
                            //   width: 20.0,
                            //   height: 20.0,
                            // )
                          ],
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        // textColor: Color(0xF9F9FB),
                        textColor: Color(0xffF9F9FB),

                        color: Color(0xff727272),
                        shape: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                width: 1.0,
                                color: Colors.transparent),
                            borderRadius: new BorderRadius.circular(15.0)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget _basicSubscriptionList(
      BuildContext context, List<PackageList> basicList) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: basicList.length,
        itemBuilder: (BuildContext ctx, int index) {
          //return new Text(listItem[index]);

          String productType = basicList.elementAt(index).packageName;
          //String productName = basicList.elementAt(index).productName;
          //bool status = basicList.elementAt(index).isActive;

          double amount = basicList.elementAt(index).packagePrice;
          //double monthlyPrice = basicList.elementAt(index).monthlyPrice;

          //bool isTaxIncluded = basicList.elementAt(index).isTaxIncluded;
          //String subscriptionTypeName =
              // basicList.elementAt(index).subscriptionTypeName;
          // String strsubscriptionTypeName = subscriptionTypeName.toString();
          //String taxIncludeValue = "";
          // DateTime startDate =
          //     DateTime.parse(basicList.elementAt(index).startDate);
          // DateTime endDate = DateTime.parse(basicList.elementAt(index).endDate);
          // DateTime now = DateTime.now();
          //
          // String startFormattedDate =
          //     DateFormat('dd-MMM-yyyy').format(startDate);
          // String endtFormattedDate = DateFormat('dd-MMM-yyyy').format(endDate);
          final difference = 2;//endDate.difference(now).inDays;
          String expire = 'Expires in ' + difference.toString() + ' days';
          //bool isActive = productInfoQuickRechargeSubscription.elementAt(index).isActive;
          // String alert = isActive ? 'Active' : 'In Active';

          /*if (isTaxIncluded) {
            taxIncludeValue = "";
          } else {
            taxIncludeValue = "";
          }*/

          int ind = index;
          return new Card(
            child: Column(
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(children: [
                    Container(
                      margin:
                          EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
                      child: Row(children: [
                        Container(
                          child: Icon(Icons.network_cell),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        // Container(
                        //   child: Text('Hello'),
                        // )
                      ]),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 10.0, top: 5),
                                  //color: Color(0xffDADADA),
                                  child: Text(
                                    productType,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff333333),
                                        fontFamily: 'Roboto_Regular'),
                                    //textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              /*Container(
                                margin: EdgeInsets.only(top: 5, right: 10),
                                color: Color(0xffDADADA),
                                child: Text(
                                  '\u{20B9} ${monthlyPrice}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff333333),
                                      fontFamily: 'Roboto_Bold'),
                                  // textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.left,
                                ),
                              ),*/
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 6,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10.0, top: 5),
                                  color: Colors.white,
                                  child: Text(
                                    'subscriptionTypeName',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff333333),
                                        fontFamily: 'Roboto_Regular'),
                                    //textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 10.0, top: 5, right: 10),
                                color: Colors.white,
                                child: Text(
                                  '\u{20B9} ${amount}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff333333),
                                      fontFamily: 'Roboto_regular'),
                                  //textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 6,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 10.0, top: 5, bottom: 5),
                                  color: Colors.white,
                                  child: Text(
                                    'startFormattedDate',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff333333),
                                        fontFamily: 'Roboto_Regular'),
                                    //textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 10.0, top: 5, bottom: 5, right: 10),
                                color: Colors.white,
                                child: Text(
                                  'endtFormattedDate',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff333333),
                                      fontFamily: 'Roboto_Regular'),
                                  // textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ])
                ]),
            color: Colors.white,
            shadowColor: Colors.white,
            elevation: 5.0,
            //margin: EdgeInsets.all(15.0),
            margin:
                EdgeInsets.only(left: 0.0, right: 0.0, top: 5.0, bottom: 5.0),
          );
        });
  }

  Widget _addOnSubscriptionList(
      BuildContext context, List<PackageList> addOnList) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: addOnList.length,
        itemBuilder: (BuildContext ctx, int index) {
          //return new Text(listItem[index]);

          String productType = addOnList.elementAt(index).packageName;
          //String productName = addOnList.elementAt(index).productName;
          //bool status = addOnList.elementAt(index).isActive;

          double amount = addOnList.elementAt(index).packagePrice;
          //double monthlyPrice = addOnList.elementAt(index).monthlyPrice;

          //bool isTaxIncluded = addOnList.elementAt(index).isTaxIncluded;
          // String subscriptionTypeName =
          //     addOnList.elementAt(index).subscriptionTypeName;
          // String strsubscriptionTypeName = subscriptionTypeName.toString();
          // String taxIncludeValue = "";
          // DateTime startDate =
          //     DateTime.parse(addOnList.elementAt(index).startDate);
          // DateTime endDate = DateTime.parse(addOnList.elementAt(index).endDate);
          // DateTime now = DateTime.now();
          //
          // String startFormattedDate =
          //     DateFormat('dd-MMM-yyyy').format(startDate);
          // String endtFormattedDate = DateFormat('dd-MMM-yyyy').format(endDate);
          final difference = 2;//endDate.difference(now).inDays;
          String expire = 'Expires in ' + difference.toString() + ' days';
          //bool isActive = productInfoQuickRechargeSubscription.elementAt(index).isActive;
          // String alert = isActive ? 'Active' : 'In Active';

          /*if (isTaxIncluded) {
            taxIncludeValue = "";
          } else {
            taxIncludeValue = "";
          }*/

          int ind = index;
          return new Card(
            child: Column(
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(children: [
                    Container(
                      margin:
                          EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
                      child: Row(children: [
                        Container(
                          child: Icon(Icons.network_cell),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        // Container(
                        //   child: Text('Hello'),
                        // )
                      ]),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 10.0, top: 5),
                                  //color: Color(0xffDADADA),
                                  child: Text(
                                    productType,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff333333),
                                        fontFamily: 'Roboto_Regular'),
                                    //textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              /*Container(
                                margin: EdgeInsets.only(top: 5, right: 10),
                                color: Color(0xffDADADA),
                                child: Text(
                                  '\u{20B9} ${monthlyPrice}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff333333),
                                      fontFamily: 'Roboto_Bold'),
                                  // textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.left,
                                ),
                              ),*/
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 6,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10.0, top: 5),
                                  color: Colors.white,
                                  child: Text(
                                    'subscriptionTypeName',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff333333),
                                        fontFamily: 'Roboto_Regular'),
                                    //textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 10.0, top: 5, right: 10),
                                color: Colors.white,
                                child: Text(
                                  '\u{20B9} ${amount}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff333333),
                                      fontFamily: 'Roboto_regular'),
                                  //textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 6,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 10.0, top: 5, bottom: 5),
                                  color: Colors.white,
                                  child: Text(
                                    'startFormattedDate',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff333333),
                                        fontFamily: 'Roboto_Regular'),
                                    //textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 10.0, top: 5, bottom: 5, right: 10),
                                color: Colors.white,
                                child: Text(
                                  'endtFormattedDate',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff333333),
                                      fontFamily: 'Roboto_Regular'),
                                  // textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ])
                ]),
            color: Colors.white,
            shadowColor: Colors.white,
            elevation: 5.0,
            //margin: EdgeInsets.all(15.0),
            margin:
                EdgeInsets.only(left: 0.0, right: 0.0, top: 5.0, bottom: 5.0),
          );
        });
  }

  Widget _aLaCarteSubscriptionList(
      BuildContext context, List<ChannelList> alaCarteList) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: alaCarteList.length,
        itemBuilder: (BuildContext ctx, int index) {
          //return new Text(listItem[index]);

          String productType = alaCarteList.elementAt(index).channelName;
          //String productName = alaCarteList.elementAt(index).productName;
          //bool status = alaCarteList.elementAt(index).isActive;

          double amount = alaCarteList.elementAt(index).channelMonthlyPrice;
          //double monthlyPrice = alaCarteList.elementAt(index).monthlyPrice;

          //bool isTaxIncluded = alaCarteList.elementAt(index).isTaxIncluded;
          // String subscriptionTypeName =
          //     alaCarteList.elementAt(index).subscriptionTypeName;
          // String strsubscriptionTypeName = subscriptionTypeName.toString();
          // String taxIncludeValue = "";
          // DateTime startDate =
          //     DateTime.parse(alaCarteList.elementAt(index).startDate);
          // DateTime endDate =
          //     DateTime.parse(alaCarteList.elementAt(index).endDate);
          // DateTime now = DateTime.now();
          //
          // String startFormattedDate =
          //     DateFormat('dd-MMM-yyyy').format(startDate);
          // String endtFormattedDate = DateFormat('dd-MMM-yyyy').format(endDate);
          final difference = 2;//endDate.difference(now).inDays;
          String expire = 'Expires in ' + difference.toString() + ' days';
          //bool isActive = productInfoQuickRechargeSubscription.elementAt(index).isActive;
          // String alert = isActive ? 'Active' : 'In Active';

          /*if (isTaxIncluded) {
            taxIncludeValue = "";
          } else {
            taxIncludeValue = "";
          }*/

          int ind = index;
          return new Card(
            child: Column(
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(children: [
                    Container(
                      margin:
                          EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
                      child: Row(children: [
                        Container(
                          child: Icon(Icons.network_cell),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        // Container(
                        //   child: Text('Hello'),
                        // )
                      ]),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 10.0, top: 5),
                                  //color: Color(0xffDADADA),
                                  child: Text(
                                    productType,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff333333),
                                        fontFamily: 'Roboto_Regular'),
                                    //textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              /*Container(
                                margin: EdgeInsets.only(top: 5, right: 10),
                                color: Color(0xffDADADA),
                                child: Text(
                                  '\u{20B9} ${monthlyPrice}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff333333),
                                      fontFamily: 'Roboto_Bold'),
                                  // textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.left,
                                ),
                              ),*/
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 6,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10.0, top: 5),
                                  color: Colors.white,
                                  child: Text(
                                    'subscriptionTypeName',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff333333),
                                        fontFamily: 'Roboto_Regular'),
                                    //textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 10.0, top: 5, right: 10),
                                color: Colors.white,
                                child: Text(
                                  '\u{20B9} ${amount}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff333333),
                                      fontFamily: 'Roboto_regular'),
                                  //textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 6,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 10.0, top: 5, bottom: 5),
                                  color: Colors.white,
                                  child: Text(
                                    'startFormattedDate',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff333333),
                                        fontFamily: 'Roboto_Regular'),
                                    //textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 10.0, top: 5, bottom: 5, right: 10),
                                color: Colors.white,
                                child: Text(
                                  'endtFormattedDate',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff333333),
                                      fontFamily: 'Roboto_Regular'),
                                  // textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ])
                ]),
            color: Colors.white,
            shadowColor: Colors.white,
            elevation: 5.0,
            //margin: EdgeInsets.all(15.0),
            margin:
                EdgeInsets.only(left: 0.0, right: 0.0, top: 5.0, bottom: 5.0),
          );
        });
  }
}
