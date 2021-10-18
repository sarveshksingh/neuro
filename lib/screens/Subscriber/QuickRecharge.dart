import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:neurosms/models/BaseModel.dart';
import 'package:neurosms/models/QuickRechargeResponse.dart';
import 'package:neurosms/models/ServerError.dart';
import 'package:neurosms/retrofit/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import '../Common.dart';

class QuickRecharge extends StatefulWidget {
  @override
  _QuickRechargeState createState() => _QuickRechargeState();
}

class _QuickRechargeState extends State<QuickRecharge> {
  var checkBoxValue;

  List<MostRecentQuickRechargeSubscriptionList>
      mostRecentQuickRechargeSubscriptionList = [];
  List<MostRecentQuickRechargeSubscriptionList>
      productInfoQuickRechargeSubscription = [];
  List<MostRecentQuickRechargeSubscriptionList> basicList = [];
  List<MostRecentQuickRechargeSubscriptionList> addOnList = [];
  List<MostRecentQuickRechargeSubscriptionList> alaCarteList = [];
  String _token, _subsId, _encdvcId;
  double basicTotal = 0.0, addOnTotal = 0.0, alaCarteTotal = 0.0;
  @override
  Widget build(BuildContext context) {
    List<String> listItem = ["Delegate", "Visitor", "Contacts", "Home"];
    return MaterialApp(
      // title: 'My Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'QuickRecharge',
            // textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Color(0xffFFFFFF),
            ),
          ),
          backgroundColor: Color(0xffDF193E),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                color: Colors.transparent,
                margin: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "MOST RECENT SUBSCRIPTION",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff333333),
                      fontFamily: 'Roboto_Bold'),
                  // textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            LimitedBox(
                maxHeight: 135,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Flexible(
                      child: _mostRescentSubscriptionListView(
                          context, mostRecentQuickRechargeSubscriptionList))
                ])),
            Container(
              //height: 490.0,
              margin: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 5.0, bottom: 15.0),
              decoration: BoxDecoration(
                // color: Colors.red,
                color: Color(0xffFFEFEE),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    // margin: EdgeInsets.only(left: 15.0,right: 15.0,bottom: 0.0),

                    margin: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0),
                    //height: 230.0,
                    color: Color(0xffFFEFEE),
                    //color: Colors.red,

                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 5.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            color: Colors.transparent,
                            margin: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              "RECHARGE SUBSCRIPTION",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff333333),
                                  fontFamily: 'Roboto_Bold'),
                              //textDirection: TextDirection.ltr,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        /*Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            color: Colors.transparent,
                            margin: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Basic" + basicTotal.toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff333333),
                                  fontFamily: 'Roboto_Bold'),
                              // textDirection: TextDirection.ltr,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),*/
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      // margin:
                                      //     EdgeInsets.only(left: 10.0, top: 5),
                                      color: Color(0xffDADADA),
                                      child: Container(
                                          margin: EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            'Basic',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xff333333),
                                                fontFamily: 'Roboto_Bold'),
                                            //textDirection: TextDirection.ltr,
                                            textAlign: TextAlign.left,
                                          )),
                                    ),
                                  ),
                                  Container(
                                    color: Color(0xffDADADA),
                                    child: Container(
                                        margin: EdgeInsets.only(right: 10.0),
                                        child: Text(
                                          '\u{20B9} ${basicTotal.toString()}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff333333),
                                              fontFamily: 'Roboto_Bold'),
                                          // textDirection: TextDirection.ltr,
                                          textAlign: TextAlign.left,
                                        )),
                                  ),
                                ],
                              )
                            ]),
                        LimitedBox(
                            maxHeight: 135,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                      child: _basicRechargeSubscriptionListView(
                                          context, basicList))
                                ])),
                        /*Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            color: Colors.transparent,
                            margin: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Add-On Package",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff333333),
                                  fontFamily: 'Roboto_Bold'),
                              // textDirection: TextDirection.ltr,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),*/
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      // margin:
                                      //     EdgeInsets.only(left: 10.0, top: 5),
                                      color: Color(0xffDADADA),
                                      child: Container(
                                          margin: EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            'Add-On Package',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xff333333),
                                                fontFamily: 'Roboto_Bold'),
                                            //textDirection: TextDirection.ltr,
                                            textAlign: TextAlign.left,
                                          )),
                                    ),
                                  ),
                                  Container(
                                    color: Color(0xffDADADA),
                                    child: Container(
                                        margin: EdgeInsets.only(right: 10.0),
                                        child: Text(
                                          '\u{20B9} ${addOnTotal.toString()}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff333333),
                                              fontFamily: 'Roboto_Bold'),
                                          // textDirection: TextDirection.ltr,
                                          textAlign: TextAlign.left,
                                        )),
                                  ),
                                ],
                              )
                            ]),
                        LimitedBox(
                            maxHeight: 135,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                      child: _addOnRechargeSubscriptionListView(
                                          context, addOnList))
                                ])),
                        /* Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            color: Colors.transparent,
                            margin: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              "A-La-Carte",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff333333),
                                  fontFamily: 'Roboto_Bold'),
                              // textDirection: TextDirection.ltr,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),*/
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      color: Color(0xffDADADA),
                                      child: Container(
                                          margin: EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            'A-La-Carte',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xff333333),
                                                fontFamily: 'Roboto_Bold'),
                                            //textDirection: TextDirection.ltr,
                                            textAlign: TextAlign.left,
                                          )),
                                    ),
                                  ),
                                  Container(
                                    color: Color(0xffDADADA),
                                    child: Container(
                                        margin: EdgeInsets.only(right: 10.0),
                                        child: Text(
                                          '\u{20B9} ${alaCarteTotal.toString()}',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff333333),
                                              fontFamily: 'Roboto_Bold'),
                                          // textDirection: TextDirection.ltr,
                                          textAlign: TextAlign.left,
                                        )),
                                  ),
                                ],
                              )
                            ]),
                        LimitedBox(
                            maxHeight: 135,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                      child:
                                          _aLaCarteRechargeSubscriptionListView(
                                              context, alaCarteList))
                                ])),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0),
                    height: 260.0,
                    decoration: BoxDecoration(
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
                                    fontSize: 12.0,
                                    fontFamily: "Roboto_Medium",
                                    color: Color(0xff333333)),
                              ),
                              SizedBox(
                                  //width: 220.0,
                                  ),
                              Text(
                                '\u{20B9} ${0.00}',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontFamily: "Roboto",
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
                                    fontSize: 12.0,
                                    fontFamily: "Roboto_Medium",
                                    color: Color(0xff333333)),
                              ),
                              SizedBox(
                                  //width: 220.0,
                                  ),
                              Text(
                                '\u{20B9} ${0.00}',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontFamily: "Roboto",
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
                                    fontSize: 12.0,
                                    fontFamily: "Roboto_Medium",
                                    color: Color(0xff333333)),
                              ),
                              SizedBox(
                                  //width: 220.0,
                                  ),
                              Text(
                                '\u{20B9} ${0.00}',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontFamily: "Roboto",
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
                                    fontSize: 12.0,
                                    fontFamily: "Roboto_Medium",
                                    color: Color(0xff333333)),
                              ),
                              SizedBox(
                                  //width: 220.0,
                                  ),
                              Text(
                                '\u{20B9} ${0.00}',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontFamily: "Roboto",
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
                                    fontSize: 12.0,
                                    fontFamily: "Roboto_Medium",
                                    color: Color(0xff333333)),
                              ),
                              SizedBox(
                                  //width: 220.0,
                                  ),
                              Text(
                                '\u{20B9} ${151.00}',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontFamily: "Roboto",
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
                                    fontSize: 12.0,
                                    fontFamily: "Roboto_Medium",
                                    color: Color(0xff333333)),
                              ),
                              Text(
                                '\u{20B9} ${0.00}',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontFamily: "Roboto",
                                    color: Color(0xff333333)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.0),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 100,
                                child: FlatButton(
                                  child: Row(
                                    children: [
                                      Text(
                                        "SUBMIT",
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontFamily: "Raleway"),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    print('Submit button Clicked');
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
                                  child: Row(
                                    children: [
                                      Text(
                                        "CANCEL",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontFamily: "Raleway",
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    print('Submit button Clicked');
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
    if (_token != null) {
      _buildBody(context, _token, _subsId, _encdvcId);
    }
  }

  Future<BaseModel<QuickRechargeResponse>> _buildBody(BuildContext context,
      String token, String subsId, String encdvcId) async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    QuickRechargeResponse response;
    final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
    try {
      Common().showAlertDialog(context);
      response = await client.getQuickRechargeData(token, subsId, encdvcId);
      Navigator.pop(context);
      setState(() {
        if (response.status == 1) {
          mostRecentQuickRechargeSubscriptionList =
              response.rechargeInfo.mostRecentQuickRechargeSubscriptionList;
          productInfoQuickRechargeSubscription =
              response.rechargeInfo.productInfoQuickRechargeSubscription;

          _mostRescentSubscriptionListView(
              context, mostRecentQuickRechargeSubscriptionList);
          for (var i = 0;
              i < productInfoQuickRechargeSubscription.length;
              i++) {
            if (productInfoQuickRechargeSubscription
                    .elementAt(i)
                    .productTypeId ==
                1) {
              basicList.add(productInfoQuickRechargeSubscription.elementAt(i));
              basicTotal = basicTotal +
                  productInfoQuickRechargeSubscription.elementAt(i).price;
            } else if (productInfoQuickRechargeSubscription
                    .elementAt(i)
                    .productTypeId ==
                2) {
              addOnList.add(productInfoQuickRechargeSubscription.elementAt(i));
              addOnTotal = addOnTotal +
                  productInfoQuickRechargeSubscription.elementAt(i).price;
            } else if (productInfoQuickRechargeSubscription
                    .elementAt(i)
                    .productTypeId ==
                3) {
              alaCarteList
                  .add(productInfoQuickRechargeSubscription.elementAt(i));
              alaCarteTotal = alaCarteTotal +
                  productInfoQuickRechargeSubscription.elementAt(i).price;
            }
          }

          _basicRechargeSubscriptionListView(context, basicList);
          _addOnRechargeSubscriptionListView(context, addOnList);
          _aLaCarteRechargeSubscriptionListView(context, alaCarteList);
          // int count = respose.transactionInfo.totalCount;
          // totalCount = 'Total Records: ' + "$count";
          // _serviceTypeList = respose.transactionInfo.serviceTypeList;
          // _serviceType = _serviceTypeList.first;
          // _paymentmodeList = respose.transactionInfo.paymentmodeList;
          // _paymentMode = _paymentmodeList.first;
          // _transactionHistoryList =
          //     respose.transactionInfo.transactionHistory;
          // _buildTransactionHistoryListView(context, _transactionHistoryList);

          // Toast.show("Data Received", context,
          //     duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
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
      BuildContext context,
      List<MostRecentQuickRechargeSubscriptionList>
          mostRecentQuickRechargeSubscriptionList) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: mostRecentQuickRechargeSubscriptionList.length,
        itemBuilder: (BuildContext ctx, int index) {
          //return new Text(listItem[index]);

          String productName = mostRecentQuickRechargeSubscriptionList
              .elementAt(index)
              .productName;
          String subscriptionTypeName = mostRecentQuickRechargeSubscriptionList
              .elementAt(index)
              .subscriptionTypeName;
          bool status =
              mostRecentQuickRechargeSubscriptionList.elementAt(index).isActive;
          String statusValue = '';
          double amount = mostRecentQuickRechargeSubscriptionList
              .elementAt(index)
              .monthlyPrice;
          // String expiryDay = mostRecentQuickRechargeSubscriptionList.elementAt(index).daysLeft as String;
          // double amount = mostRecentQuickRechargeSubscriptionList.elementAt(index).price;
          // String startDate = mostRecentQuickRechargeSubscriptionList.elementAt(index).startDate as String;
          // String endDate = mostRecentQuickRechargeSubscriptionList.elementAt(index).endDate as String;
          DateTime startDate = mostRecentQuickRechargeSubscriptionList
              .elementAt(index)
              .startDate;
          DateTime endDate =
              mostRecentQuickRechargeSubscriptionList.elementAt(index).endDate;
          DateTime now = DateTime.now();

          String startFormattedDate =
              DateFormat('dd-MMM-yyyy').format(startDate);
          String enddtFormattedDate = DateFormat('dd-MMM-yyyy').format(endDate);
          // final difference = endDate.difference(now).inDays;
          // String expire = 'Expires in ' + difference.toString() + ' days';
          bool isActive =
              mostRecentQuickRechargeSubscriptionList.elementAt(index).isActive;
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

  Widget _basicRechargeSubscriptionListView(BuildContext context,
      List<MostRecentQuickRechargeSubscriptionList> basicList) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: basicList.length,
        itemBuilder: (BuildContext ctx, int index) {
          //return new Text(listItem[index]);

          String productType = basicList.elementAt(index).broadcasterName;
          String productName = basicList.elementAt(index).productName;
          bool status = basicList.elementAt(index).isActive;

          double amount = basicList.elementAt(index).price;
          double monthlyPrice = basicList.elementAt(index).monthlyPrice;

          bool isTaxIncluded = basicList.elementAt(index).isTaxIncluded;
          String subscriptionTypeName =
              basicList.elementAt(index).subscriptionTypeName;
          // String strsubscriptionTypeName = subscriptionTypeName.toString();
          String taxIncludeValue = "";
          DateTime startDate = basicList.elementAt(index).startDate;
          DateTime endDate = basicList.elementAt(index).endDate;
          DateTime now = DateTime.now();

          String startFormattedDate =
              DateFormat('dd-MMM-yyyy').format(startDate);
          String endtFormattedDate = DateFormat('dd-MMM-yyyy').format(endDate);
          final difference = endDate.difference(now).inDays;
          String expire = 'Expires in ' + difference.toString() + ' days';
          //bool isActive = productInfoQuickRechargeSubscription.elementAt(index).isActive;
          // String alert = isActive ? 'Active' : 'In Active';

          if (isTaxIncluded) {
            taxIncludeValue = "";
          } else {
            taxIncludeValue = "";
          }

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
                                  color: Color(0xffDADADA),
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
                              Container(
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
                              ),
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
                                    subscriptionTypeName,
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
                                    startFormattedDate,
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
                                  endtFormattedDate,
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

  Widget _addOnRechargeSubscriptionListView(BuildContext context,
      List<MostRecentQuickRechargeSubscriptionList> addOnList) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: addOnList.length,
        itemBuilder: (BuildContext ctx, int index) {
          //return new Text(listItem[index]);

          String productType = addOnList.elementAt(index).broadcasterName;
          String productName = addOnList.elementAt(index).productName;
          bool status = addOnList.elementAt(index).isActive;

          double amount = addOnList.elementAt(index).price;
          double monthlyPrice = addOnList.elementAt(index).monthlyPrice;

          bool isTaxIncluded = addOnList.elementAt(index).isTaxIncluded;
          String subscriptionTypeName =
              addOnList.elementAt(index).subscriptionTypeName;
          // String strsubscriptionTypeName = subscriptionTypeName.toString();
          String taxIncludeValue = "";
          DateTime startDate = addOnList.elementAt(index).startDate;
          DateTime endDate = addOnList.elementAt(index).endDate;
          DateTime now = DateTime.now();

          String startFormattedDate =
              DateFormat('dd-MMM-yyyy').format(startDate);
          String endtFormattedDate = DateFormat('dd-MMM-yyyy').format(endDate);
          final difference = endDate.difference(now).inDays;
          String expire = 'Expires in ' + difference.toString() + ' days';
          //bool isActive = productInfoQuickRechargeSubscription.elementAt(index).isActive;
          // String alert = isActive ? 'Active' : 'In Active';

          if (isTaxIncluded) {
            taxIncludeValue = "";
          } else {
            taxIncludeValue = "";
          }

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
                                  color: Color(0xffDADADA),
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
                              Container(
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
                              ),
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
                                    subscriptionTypeName,
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
                                    startFormattedDate,
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
                                  endtFormattedDate,
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

  Widget _aLaCarteRechargeSubscriptionListView(BuildContext context,
      List<MostRecentQuickRechargeSubscriptionList> alaCarteList) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: alaCarteList.length,
        itemBuilder: (BuildContext ctx, int index) {
          //return new Text(listItem[index]);

          String productType = alaCarteList.elementAt(index).broadcasterName;
          String productName = alaCarteList.elementAt(index).productName;
          bool status = alaCarteList.elementAt(index).isActive;

          double amount = alaCarteList.elementAt(index).price;
          double monthlyPrice = alaCarteList.elementAt(index).monthlyPrice;

          bool isTaxIncluded = alaCarteList.elementAt(index).isTaxIncluded;
          String subscriptionTypeName =
              alaCarteList.elementAt(index).subscriptionTypeName;
          // String strsubscriptionTypeName = subscriptionTypeName.toString();
          String taxIncludeValue = "";
          DateTime startDate = alaCarteList.elementAt(index).startDate;
          DateTime endDate = alaCarteList.elementAt(index).endDate;
          DateTime now = DateTime.now();

          String startFormattedDate =
              DateFormat('dd-MMM-yyyy').format(startDate);
          String endtFormattedDate = DateFormat('dd-MMM-yyyy').format(endDate);
          final difference = endDate.difference(now).inDays;
          String expire = 'Expires in ' + difference.toString() + ' days';
          //bool isActive = productInfoQuickRechargeSubscription.elementAt(index).isActive;
          // String alert = isActive ? 'Active' : 'In Active';

          if (isTaxIncluded) {
            taxIncludeValue = "";
          } else {
            taxIncludeValue = "";
          }

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
                                  color: Color(0xffDADADA),
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
                              Container(
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
                              ),
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
                                    subscriptionTypeName,
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
                                    startFormattedDate,
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
                                  endtFormattedDate,
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
