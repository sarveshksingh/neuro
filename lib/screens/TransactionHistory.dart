import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:neurosms/models/SubsTransactionHistoryResponse.dart';
import 'package:neurosms/retrofit/api_client.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class TransactionHistory extends StatefulWidget {
  static const String routeName = '/transaction';

  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  var checkBoxValue;
  String _token, _subsWalletId;

  @override
  Widget build(BuildContext context) {
    List<String> listItem = ["Delegate", "Visitor", "Contacts", "Home"];
    return MaterialApp(
      // title: 'My Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Transaction History',
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Color(0xffFFFFFF)),
          ),
          backgroundColor: Color(0xffDF193E),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            //Container data

            Container(
              height: 310.0,
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
                        EdgeInsets.only(left: 15.0, right: 15.0, bottom: 0.0),
                    height: 310.0,
                    color: Color(0xffFFEFEE),
                    // color: Colors.red,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            color: Colors.transparent,
                            margin:
                                const EdgeInsets.only(left: 5.0, right: 0.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "TRANSACTION HISTORY",
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xff333333)),
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(width: 123),
                                //
                                SizedBox(
                                  width: 50,
                                  child: FlatButton(
                                    child: Row(
                                      children: [
                                        // Image.asset(
                                        //   'assets/images/dot.png',
                                        //   width: 5.0,
                                        //   height: 30.0,
                                        // )
                                        //child: Icon(Icons.school)
                                        Container(
                                          margin: EdgeInsets.only(right: 20.0),
                                          child: SvgPicture.asset('assets/images/wallet.svg')
                                          //child: Icon(Icons.),
                                        )
                                      ],
                                    ),
                                    onPressed: () {
                                      print('dot Btton tapped');
                                    },

                                    textColor: Color(0xff333333),

                                    //color: Color(0xffFFFFFF),
                                    color: Colors.transparent,
                                    // shape: OutlineInputBorder(
                                    //     borderSide: BorderSide(
                                    //         style: BorderStyle.solid, width: 1.0, color: Colors.transparent),
                                    //     borderRadius: new BorderRadius.circular(15.0)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 350,
                          child: FlatButton(
                            child: Row(
                              children: [
                                Text(
                                  "Service Type",
                                  style: TextStyle(
                                      fontSize: 13.0, fontFamily: "Raleway"),
                                ),
                                SizedBox(
                                  width: 220.0,
                                ),
                                Image.asset(
                                  'assets/images/DownArrow.png',
                                  width: 15.0,
                                  height: 15.0,
                                )
                              ],
                            ),
                            onPressed: () {
                              print('Service type tapped');
                            },

                            textColor: Color(0xff333333),

                            color: Color(0xffFFFFFF),
                            // shape: OutlineInputBorder(
                            //     borderSide: BorderSide(
                            //         style: BorderStyle.solid, width: 1.0, color: Colors.transparent),
                            //     borderRadius: new BorderRadius.circular(15.0)),
                          ),
                        ),
                        SizedBox(width: 1),
                        SizedBox(
                          width: 350,
                          child: FlatButton(
                            child: Row(
                              children: [
                                Text(
                                  "Payment Mode",
                                  style: TextStyle(
                                      fontSize: 13.0, fontFamily: "Raleway"),
                                ),
                                SizedBox(
                                  width: 205.0,
                                ),
                                //Icons.margin = EdgeInsets.only(right: 5.0),
                                Image.asset(
                                  'assets/images/DownArrow.png',
                                  width: 15.0,
                                  height: 15.0,
                                )
                              ],
                            ),
                            onPressed: () {
                              print('Payment Mode tapped');
                            },

                            textColor: Color(0xff333333),

                            color: Color(0xffFFFFFF),
                            // shape: OutlineInputBorder(
                            //     borderSide: BorderSide(
                            //         style: BorderStyle.solid, width: 1.0, color: Colors.transparent),
                            //     borderRadius: new BorderRadius.circular(15.0)),
                          ),
                        ),
                        SizedBox(width: 1),
                        SizedBox(
                          width: 350,
                          child: FlatButton(
                            child: Row(
                              children: [
                                Text(
                                  "From",
                                  style: TextStyle(
                                      fontSize: 13.0, fontFamily: "Raleway"),
                                ),
                                SizedBox(
                                  width: 266.0,
                                ),
                                Image.asset(
                                  'assets/images/DownArrow.png',
                                  width: 15.0,
                                  height: 15.0,
                                )
                              ],
                            ),
                            onPressed: () {
                              print('From Button tapped');
                            },

                            textColor: Color(0xff333333),

                            color: Color(0xffFFFFFF),
                            // shape: OutlineInputBorder(
                            //     borderSide: BorderSide(
                            //         style: BorderStyle.solid, width: 1.0, color: Colors.transparent),
                            //     borderRadius: new BorderRadius.circular(15.0)),
                          ),
                        ),
                        SizedBox(width: 1),
                        SizedBox(
                          width: 350,
                          child: FlatButton(
                            child: Row(
                              children: [
                                Text(
                                  "To",
                                  style: TextStyle(
                                      fontSize: 13.0, fontFamily: "Raleway"),
                                ),
                                SizedBox(
                                  width: 282.0,
                                ),
                                Image.asset(
                                  'assets/images/DownArrow.png',
                                  width: 15.0,
                                  height: 15.0,
                                )
                              ],
                            ),
                            onPressed: () {
                              print('To button tapped');
                            },

                            textColor: Color(0xff333333),

                            color: Color(0xffFFFFFF),
                            // shape: OutlineInputBorder(
                            //     borderSide: BorderSide(
                            //         style: BorderStyle.solid, width: 1.0, color: Colors.transparent),
                            //     borderRadius: new BorderRadius.circular(15.0)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.0, top: 5.0),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                // width: 100,
                                child: FlatButton(
                                  child: Row(
                                    children: [
                                      Text(
                                        "SEARCH",
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontFamily: "Raleway"),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    print('Search button Clicked');
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
                                //width: 100,
                                child: FlatButton(
                                  child: Row(
                                    children: [
                                      Text(
                                        "RESET",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontFamily: "Raleway",
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    print('Reset button Clicked');
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
            SizedBox(height: 0.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                color: Colors.transparent,
                height: 30.0,
                margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Total Records: 23",
                      style: TextStyle(fontSize: 14, color: Color(0xff333333)),
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      width: 163.0,
                    ),
                    SizedBox(
                      height: 30.0,
                      child: FlatButton(
                        child: Row(
                          children: [
                            // Image.asset(
                            //   'assets/images/pluse.png',
                            //   width: 20.0,
                            //   height: 20.0,
                            // ),
                            Text(
                              "Download",
                              style: TextStyle(
                                  fontSize: 15.0, fontFamily: "Raleway"),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        onPressed: () {
                          print('Download button Clicked');
                        },
                        textColor: Color(0xffFFFFFF),
                        color: Color(0xffDF193E),
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
              ),
            ),

            // List view container Code

            Container(
              height: 420,
              child: Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                      itemCount: listItem.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        //return new Text(listItem[index]);
                        int ind = index;
                        return new Card(
                          child: Row(
                            children: [
                              //For Image
                              /*
                              Column(

                                children:<Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left:25.0,top: 20.0,bottom: 20.0),

                                    child: Row(
                                        children:[
                                          Container(
                                            child: Icon(Icons.network_cell),
                                          ),
                                          SizedBox(width: 20,),
                                          // Container(
                                          //   child: Text('Hello'),
                                          // )
                                        ]


                                    ),
                                  ),
                                ],
                              ),

                             */

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  /* ListTile(
                                     leading: Icon(Icons.wifi),
                                       title: Text(listItem[index],style: TextStyle(fontSize: 18,color: Colors.grey),),

                                       ),
                                    */
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 15.0, top: 20.0),
                                    child: Row(children: [
                                      // Container(
                                      //   child: Icon(Icons.network_cell),
                                      // ),
                                      // SizedBox(width: 10,),
                                      Container(
                                        child: Text('Date',
                                            style: TextStyle(
                                                color: Color(0xff333333),
                                                fontSize: 12.0)),
                                      )
                                    ]),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15.0, top: 5),
                                    child: Row(children: [
                                      // Container(
                                      //   child: Icon(Icons.network_cell),
                                      //
                                      // ),
                                      //SizedBox(width: 10),
                                      Container(
                                        child: Text(
                                          'Service Type',
                                          style: TextStyle(
                                              color: Color(0xff333333),
                                              fontSize: 12.0),
                                        ),
                                      )
                                    ]),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15.0, top: 5),
                                    child: Row(children: [
                                      // Container(
                                      //   child: Icon(Icons.network_cell),
                                      //
                                      // ),
                                      //SizedBox(width: 10),
                                      Container(
                                        child: Text(
                                          'Description',
                                          style: TextStyle(
                                              color: Color(0xff333333),
                                              fontSize: 12.0),
                                        ),
                                      )
                                    ]),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15.0, top: 5),
                                    child: Row(children: [
                                      // Container(
                                      //   child: Icon(Icons.network_cell),
                                      //
                                      // ),
                                      //SizedBox(width: 10),
                                      Container(
                                        child: Text(
                                          'Reference ID',
                                          style: TextStyle(
                                              color: Color(0xff333333),
                                              fontSize: 12.0),
                                        ),
                                      )
                                    ]),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15.0, top: 5),
                                    child: Row(children: [
                                      // Container(
                                      //   child: Icon(Icons.network_cell),
                                      //
                                      // ),
                                      //SizedBox(width: 10),
                                      Container(
                                        child: Text(
                                          'Payment Mode',
                                          style: TextStyle(
                                              color: Color(0xff333333),
                                              fontSize: 12.0),
                                        ),
                                      )
                                    ]),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 15.0, top: 15.0, bottom: 20.0),
                                    child: Row(children: [
                                      // Container(
                                      //   child: Icon(Icons.network_cell),
                                      //
                                      // ),
                                      //SizedBox(width: 10),
                                      Container(
                                        child: Text(
                                          'Debit',
                                          style: TextStyle(
                                              color: Color(0xffE02935),
                                              fontSize: 12.0),
                                        ),
                                      )
                                    ]),
                                  ),
                                ],
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 10.0, top: 20.0),
                                    child: Row(children: [
                                      // Container(
                                      //   child: Icon(Icons.network_cell),
                                      // ),
                                      // SizedBox(width: 20,),
                                      Container(
                                        child: Text(
                                          '6-Sep-2021 18:16:37',
                                          style: TextStyle(
                                              color: Color(0xff333333),
                                              fontSize: 12.0),
                                          textAlign: TextAlign.left,
                                          textDirection: TextDirection.ltr,
                                        ),
                                      )
                                    ]),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10.0, top: 5),
                                    child: Row(children: [
                                      // Container(
                                      //   child: Icon(Icons.network_cell),
                                      //
                                      // ),
                                      //SizedBox(width: 10),
                                      Container(
                                        child: Text(
                                          'Subscription Recharge',
                                          style: TextStyle(
                                              color: Color(0xff333333),
                                              fontSize: 12.0),
                                          textAlign: TextAlign.left,
                                          textDirection: TextDirection.ltr,
                                        ),
                                      )
                                    ]),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10.0, top: 5),
                                    child: Row(children: [
                                      // Container(
                                      //   child: Icon(Icons.network_cell),
                                      //
                                      // ),
                                      //SizedBox(width: 10),
                                      Container(
                                        child: Text(
                                            '192EE414CC6E-8200004313006110',
                                            style: TextStyle(
                                                color: Color(0xff333333),
                                                fontSize: 12.0),
                                            textAlign: TextAlign.left,
                                            textDirection: TextDirection.ltr),
                                      )
                                    ]),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10.0, top: 5),
                                    child: Row(children: [
                                      // Container(
                                      //   child: Icon(Icons.network_cell),
                                      //
                                      // ),
                                      //SizedBox(width: 10),

                                      Container(
                                        child: Text('239975',
                                            style: TextStyle(
                                                color: Color(0xff333333),
                                                fontSize: 12.0),
                                            textAlign: TextAlign.left,
                                            textDirection: TextDirection.ltr),
                                      )
                                    ]),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10.0, top: 5),
                                    child: Row(children: [
                                      // Container(
                                      //   child: Icon(Icons.network_cell),
                                      //
                                      // ),
                                      //SizedBox(width: 10),
                                      Container(
                                        child: Text(
                                          'Wallet Transfer',
                                          style: TextStyle(
                                              color: Color(0xff333333),
                                              fontSize: 12.0),
                                        ),
                                      )
                                    ]),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 10.0, top: 15, bottom: 20.0),
                                    child: Row(children: [
                                      // Container(
                                      //   child: Icon(Icons.network_cell),
                                      //
                                      // ),
                                      //SizedBox(width: 10),
                                      Container(
                                        //margin: EdgeInsets.only(left:10.0,top: 10,bottom: 20.0),
                                        child: Text(
                                          '1.18',
                                          style: TextStyle(
                                              color: Color(0xffE02935),
                                              fontSize: 12.0),
                                        ),
                                      ),
                                      SizedBox(width: 60),
                                      Container(
                                        //margin: EdgeInsets.only(left:10.0,top: 10,bottom: 20.0),
                                        child: Text(
                                          'Credit',
                                          style: TextStyle(
                                              color: Color(0xff00BE0D),
                                              fontSize: 12.0),
                                        ),
                                      ),
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
                              left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
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
    _subsWalletId = (prefs.getString('subsWalletId') ?? null);
    if (_token != null) {
      _buildBody(context, _token, _subsWalletId);
    }
  }

  Future<FutureBuilder<SubsTransactionHistoryResponse>> _buildBody(
      BuildContext context, String token, String subsWalletId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<SubsTransactionHistoryResponse>(
      future: client
          .getSubsTransactnHistory(
              token, subsWalletId, '', '', '', '0', '0', '0', '', '')
          .then((respose) {
        //setState(() => _isLoading = false);
        setState(() {
          if (respose.status == 1) {
            /*logoPath = respose.logoPath;
            prefs.setString('User_ID', respose.dashboardinfo.userDetail.userId);
            prefs.setString('Name', respose.dashboardinfo.userDetail.userId);
            userName = respose.dashboardinfo.subscriberProfile.subscriberName;
            companyName =
                respose.dashboardinfo.subscriberProfile.mainAccountName;
            contactNumber = respose.dashboardinfo.subscriberProfile
                .subscriberProfileAddress.phoneNo;
            email = respose.dashboardinfo.subscriberProfile.subscriberEmail;
            currentBalance = respose
                .dashboardinfo.subscriberProfile.subscriberTotalWalletBalance
                .toString();
            Toast.show("Get Dashboard Data successfully", context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
            _hardwareDetailsList = respose.dashboardinfo.hardwareDetailsList;
            _buildListView(context, _hardwareDetailsList);*/
            Toast.show("Data Received", context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
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
