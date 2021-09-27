import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:neurosms/models/QuickRechargeResponse.dart';
import 'package:neurosms/retrofit/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class QuickRecharge extends StatefulWidget
{
  @override
  _QuickRechargeState createState() => _QuickRechargeState();
}

class _QuickRechargeState extends State<QuickRecharge> {
  var checkBoxValue;
/*
  List<EList> _paymentmodeList = [];
  List<EList> _serviceTypeList = [];
  List<TransactionHistory> _transactionHistoryList = [];
  static final List<String> _downloadTypeList = <String>['pdf', 'Excel'];
  var checkBoxValue;
  String _token,
      _subsWalletId,
      _encDvcMapId,
      totalCount = '',
      _downloadType = _downloadTypeList.first,
      fromDate = '',
      toDate = '';
  EList _serviceType, _paymentMode;
  int transactionTypeId = 0;


*/
  List<MostRecentQuickRechargeSubscriptionList> mostRecentQuickRechargeSubscriptionList;
  List<MostRecentQuickRechargeSubscriptionList> productInfoQuickRechargeSubscription;
  String _token,
      _subsId,
      _encdvcId;


  @override
  Widget build(BuildContext context) {
    List <String> listItem = ["Delegate","Visitor","Contacts","Home"];
    return MaterialApp(
      // title: 'My Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

          title: Text('QuickRecharge',textDirection: TextDirection.ltr,style: TextStyle(color: Color(0xffFFFFFF),),),
          backgroundColor:Color(0xffDF193E),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),

          centerTitle: false,
        ),

        body: Column(
          children: <Widget>[
            SizedBox(
                height: 10.0
            ),

            Align(
              alignment: Alignment.centerLeft,

              child: Container(
                color: Colors.transparent,

                margin: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "MOST RECENT SUBSCRIPTION",
                  style: TextStyle(fontSize: 14, color: Color(0xff333333),fontFamily: 'Roboto_Bold'),
                  textDirection: TextDirection.ltr,textAlign: TextAlign.left,
                ),
              ),
            ),


            Container(
              //color: Colors.red,
              height: 250,
              child: Expanded(
                child: Container(

                  margin: EdgeInsets.only(top: 10),


                  child:ListView.builder(
                      itemCount: listItem.length,
                      itemBuilder: (BuildContext ctx, int index){
                        //return new Text(listItem[index]);
                      /*
                        String date = transactionHistoryList.elementAt(index).transactionDate;
                        String serviceName =
                            transactionHistoryList.elementAt(index).serviceName;
                        String description =
                            transactionHistoryList.elementAt(index).description;
                        int refrenceId =
                            transactionHistoryList.elementAt(index).transactionId;
                        String paymentMode =
                            transactionHistoryList.elementAt(index).paymentMode;
                        double debit = transactionHistoryList.elementAt(index).debit;
                        double credit = transactionHistoryList.elementAt(index).credit;
                        */

                        int ind = index;
                        return new Card(

                          child: Row(
                            children: [

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

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  /* ListTile(
                leading: Icon(Icons.wifi),
                title: Text(listItem[index],style: TextStyle(fontSize: 18,color: Colors.grey),),

              ),*/
                                  Container(
                                    margin: EdgeInsets.only(left:15.0,top: 20.0),

                                    child: Row(
                                        children:[
                                          // Container(
                                          //   child: Icon(Icons.network_cell),
                                          // ),
                                          // SizedBox(width: 10,),
                                          Container(
                                            child: Text(
                                              'Basic',
                                              style: TextStyle(fontSize: 12, color: Color(0xff333333),fontFamily: 'Roboto_Medium'),
                                              textDirection: TextDirection.ltr,textAlign: TextAlign.left,
                                            ),

                                          )
                                        ]


                                    ),
                                  ),


                                  Container(
                                    margin: EdgeInsets.only(left:15.0,top: 5),

                                    child: Row(
                                        children:[

                                          // Container(
                                          //   child: Icon(Icons.network_cell),
                                          //
                                          // ),
                                          //SizedBox(width: 10),

                                          Container(
                                            child: Text(
                                              'Active',
                                              style: TextStyle(fontSize: 12, color: Color(0xff227700),fontFamily: 'Roboto_Regular'),
                                              textDirection: TextDirection.ltr,textAlign: TextAlign.left,
                                            ),


                                          )
                                        ]

                                    ),
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(left:15.0,top: 5,bottom: 20),

                                    child: Row(
                                        children:[

                                          // Container(
                                          //   child: Icon(Icons.network_cell),
                                          //
                                          // ),
                                          //SizedBox(width: 10),
                                          Container(
                                            child: Text(
                                              '16-Sept-2021',
                                              style: TextStyle(fontSize: 12, color: Color(0xff333333),fontFamily: 'Roboto_Regular'),
                                              textDirection: TextDirection.ltr,textAlign: TextAlign.left,
                                            ),
                                          )
                                        ]

                                    ),
                                  ),



                                ],

                              ),

                              Column(

                                children:<Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left:5.0,top: 20.0,bottom: 20.0),

                                    child: Row(
                                        children:[
                                          // Container(
                                          //   child: Icon(Icons.network_cell),
                                          // ),
                                          // SizedBox(width: 20,),
                                          Container(
                                            child: Text(
                                              '20 Days ago',
                                              style: TextStyle(fontSize: 10, color: Color(0xff808080),fontFamily: 'Roboto_Medium'),
                                              textDirection: TextDirection.ltr,textAlign: TextAlign.left,
                                            ),
                                          )
                                        ]


                                    ),
                                  ),
                                ],
                              ),

                              // For Second Column
                              Column(


                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left:50.0,top: 20.0),

                                    child: Row(
                                        children:[

                                          // Container(
                                          //   child: Icon(Icons.network_cell),
                                          //
                                          // ),
                                          // SizedBox(width: 10),
                                          Container(
                                            child: Text(
                                              '\u{20B9} ${222.45}',
                                              style: TextStyle(fontSize: 12, color: Color(0xff333333),fontFamily: 'Roboto_Regular'),
                                              textDirection: TextDirection.ltr,textAlign: TextAlign.left,
                                            ),
                                          )
                                        ]

                                    ),
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(left:50.0,top: 5.0),

                                    child: Row(
                                        children:[

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
                                            child: Text(
                                              '16-Oct-2021',
                                              style: TextStyle(fontSize: 12, color: Color(0xff333333),fontFamily: 'Roboto_Regular'),
                                              textDirection: TextDirection.ltr,textAlign: TextAlign.left,
                                            ),

                                          )

                                        ]

                                    ),
                                  ),
                                ],

                              ),






                            ],
                          ),

                          color: Colors.white,
                          shadowColor: Colors.lightBlue,
                          elevation: 5.0,
                          //margin: EdgeInsets.all(15.0),
                          margin: EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0,bottom: 5.0),
                        );

                      }
                  ),


                ),
              ),
            ),

            Container(
              height: 490.0,
              margin: EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0,bottom: 15.0),

              decoration: BoxDecoration(
                /*
                border: Border.all(
                  color: Color(0xFFF05A22),
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                 */
               // color: Colors.red,
                color: Color(0xffFFEFEE),
                borderRadius: BorderRadius.circular(10.0),
              ),

              child: Column(
                children: <Widget>[

                  Container(

                   // margin: EdgeInsets.only(left: 15.0,right: 15.0,bottom: 0.0),

                    margin: EdgeInsets.only(left: 0.0,right: 0.0,bottom: 0.0),
                    height: 230.0,
                    color: Color(0xffFFEFEE),
                    //color: Colors.red,


                    child: Column(
                      children: <Widget>[
                        SizedBox(
                            height: 5.0
                        ),
                        Align(
                          alignment: Alignment.centerLeft,

                          child: Container(
                            color: Colors.transparent,

                            margin: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              "RECHARGE SUBSCRIPTION",
                              style: TextStyle(fontSize: 14, color: Color(0xff333333),fontFamily: 'Roboto_Bold'),
                              textDirection: TextDirection.ltr,textAlign: TextAlign.left,
                            ),
                          ),
                        ),

                        Expanded(
                          child: Container(

                            margin: EdgeInsets.only(top: 2),


                            child:ListView.builder(
                                itemCount: listItem.length,
                                itemBuilder: (BuildContext ctx, int index){
                                  //return new Text(listItem[index]);


                                  int ind = index;
                                  return new Card(
                                    child: Column(
                                      //crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Expanded(

                                              child: Container(
                                                margin: EdgeInsets.only(left: 10.0,top: 10),
                                                color: Color(0xffDADADA),
                                                child: Text(
                                                  "BASIC PACKAGE",
                                                  style: TextStyle(fontSize: 16, color: Color(0xff333333),fontFamily: 'Roboto_Bold'),
                                                  textDirection: TextDirection.ltr,textAlign: TextAlign.left,
                                                ),
                                              ),
                                            ),
                                             Container(
                                                margin: EdgeInsets.only(right: 0.0,top: 10),
                                                color: Color(0xffDADADA),
                                                child: Text(
                                                  '\u{20B9} ${50}',
                                                  style: TextStyle(fontSize: 16, color: Color(0xff333333),fontFamily: 'Roboto_Bold'),
                                                  textDirection: TextDirection.ltr,textAlign: TextAlign.left,
                                                ),
                                              ),


                                      ],
                                    ),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex:6,
                                              child: Container(
                                                margin: EdgeInsets.only(left: 10.0,top: 10),
                                                color: Colors.white,
                                                child: Text(
                                                  'BASICK PACKAGE TAX INCLUDE',
                                                  style: TextStyle(fontSize: 12, color: Color(0xff333333),fontFamily: 'Roboto_Regular'),
                                                  textDirection: TextDirection.ltr,textAlign: TextAlign.left,
                                                ),
                                              ),
                                            ),


                                          ],
                                        ),

                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex:6,
                                              child: Container(
                                                margin: EdgeInsets.only(left: 10.0,top: 10),
                                                color: Colors.white,
                                                child: Text(
                                                  'Monthly @ 1',
                                                  style: TextStyle(fontSize: 12, color: Color(0xff333333),fontFamily: 'Roboto_Regular'),
                                                  textDirection: TextDirection.ltr,textAlign: TextAlign.left,
                                                ),
                                              ),
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(left: 10.0,top: 10),
                                                color: Colors.white,
                                                child: Text(
                                                  '\u{20B9} ${50}',
                                                  style: TextStyle(fontSize: 12, color: Color(0xff333333),fontFamily: 'Roboto_regular'),
                                                  textDirection: TextDirection.ltr,textAlign: TextAlign.left,
                                                ),
                                              ),


                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex:6,
                                              child: Container(
                                                margin: EdgeInsets.only(left: 10.0,top: 10,bottom: 10),
                                                color: Colors.white,
                                                child: Text(
                                                  '16-Oct-2021',
                                                  style: TextStyle(fontSize: 12, color: Color(0xff333333),fontFamily: 'Roboto_Regular'),
                                                  textDirection: TextDirection.ltr,textAlign: TextAlign.left,
                                                ),
                                              ),
                                            ),
                                             Container(
                                                margin: EdgeInsets.only(left: 10.0,top: 10,bottom: 10),
                                                color: Colors.white,
                                                child: Text(
                                                  '15-Nov-2021',
                                                  style: TextStyle(fontSize: 12, color: Color(0xff333333),fontFamily: 'Roboto_Regular'),
                                                  textDirection: TextDirection.ltr,textAlign: TextAlign.left,
                                                ),
                                              ),


                                          ],
                                        ),


                                  ],
                                  ),

                                    color: Colors.white,
                                    shadowColor: Colors.white,
                                    elevation: 5.0,
                                    //margin: EdgeInsets.all(15.0),
                                    margin: EdgeInsets.only(left: 0.0,right: 0.0,top: 5.0,bottom: 5.0),

                                  );

                                }
                            ),


                          ),
                        ),

                      ],
                    ),


                  ),




                  Container(

                    margin: EdgeInsets.only(left: 0.0,right: 0.0,bottom: 0.0),
                    height: 260.0,
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
                          margin: EdgeInsets.only(left: 5.0,right: 5.0,top: 5.0),
                          height: 30,
                          color: Color(0xffFBFBFB),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Sub Total",

                                style: TextStyle(fontSize: 12.0, fontFamily: "Roboto_Medium",color: Color(0xff333333)),
                              ),
                              SizedBox(
                                //width: 220.0,
                              ),
                              Text(
                                '\u{20B9} ${0.00}',
                                style: TextStyle(fontSize: 12.0, fontFamily: "Roboto",color: Color(0xff333333)),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          //width: 300,
                          margin: EdgeInsets.only(left: 5.0,right: 5.0,top: 5.0),
                          height: 30,
                          color: Color(0xffFBFBFB),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "CGST (9.00%)",

                                style: TextStyle(fontSize: 12.0, fontFamily: "Roboto_Medium",color: Color(0xff333333)),
                              ),
                              SizedBox(
                                //width: 220.0,
                              ),
                              Text(
                                '\u{20B9} ${0.00}',
                                style: TextStyle(fontSize: 12.0, fontFamily: "Roboto",color: Color(0xff333333)),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          //width: 300,
                          margin: EdgeInsets.only(left: 5.0,right: 5.0,top: 5.0),
                          height: 30,
                          color: Color(0xffFBFBFB),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "SGST (9.00%)",

                                style: TextStyle(fontSize: 12.0, fontFamily: "Roboto_Medium",color: Color(0xff333333)),
                              ),
                              SizedBox(
                                //width: 220.0,
                              ),
                              Text(
                                '\u{20B9} ${0.00}',
                                style: TextStyle(fontSize: 12.0, fontFamily: "Roboto",color: Color(0xff333333)),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          //width: 300,
                          margin: EdgeInsets.only(left: 5.0,right: 5.0,top: 5.0),
                          height: 30,
                          color: Color(0xffDADADA),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(fontSize: 12.0, fontFamily: "Roboto_Medium",color: Color(0xff333333)),
                              ),
                              SizedBox(
                                //width: 220.0,
                              ),
                              Text(
                                '\u{20B9} ${0.00}',
                                style: TextStyle(fontSize: 12.0, fontFamily: "Roboto",color: Color(0xff333333)),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          //width: 300,
                          margin: EdgeInsets.only(left: 5.0,right: 5.0,top: 5.0),
                          height: 30,
                          color: Color(0xffFBFBFB),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Wallet Balance",
                                style: TextStyle(fontSize: 12.0, fontFamily: "Roboto_Medium",color: Color(0xff333333)),
                              ),
                              SizedBox(
                                //width: 220.0,
                              ),
                              Text(
                                '\u{20B9} ${151.00}',
                                style: TextStyle(fontSize: 12.0, fontFamily: "Roboto",color: Color(0xff333333)),
                              ),
                            ],
                          ),
                        ),


                        Container(
                          //width: 300,
                          margin: EdgeInsets.only(left: 5.0,right: 5.0,top: 5.0),
                          height: 30,
                          color: Color(0xffDADADA),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Net Payable Amount",
                                style: TextStyle(fontSize: 12.0, fontFamily: "Roboto_Medium",color: Color(0xff333333)),
                              ),
                              SizedBox(
                                //width: 220.0,
                              ),
                              Text(
                                '\u{20B9} ${0.00}',
                                style: TextStyle(fontSize: 12.0, fontFamily: "Roboto",color: Color(0xff333333)),
                              ),
                            ],
                          ),
                        ),
/*


*/                    Container(
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
                                        style: TextStyle(fontSize: 15.0, fontFamily: "Raleway"),
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
                                          style: BorderStyle.solid, width: 1.0, color: Colors.transparent),
                                      borderRadius: new BorderRadius.circular(15.0)),
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
                                        style: TextStyle(fontSize: 15.0, fontFamily: "Raleway",),
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
                                          style: BorderStyle.solid, width: 1.0, color: Colors.transparent),
                                      borderRadius: new BorderRadius.circular(15.0)),
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
    _subsId = (prefs.getString('subsId') ?? null);
    _encdvcId = (prefs.getString('encdvcId') ?? '');
    if (_token != null) {
      _buildBody(context, _token, _subsId, _encdvcId);
    }
  }

  Future<FutureBuilder<QuickRechargeResponse>> _buildBody(
      BuildContext context,
      String token,
      String subsId,
      String encdvcId
      ) async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<QuickRechargeResponse>(
      future: client
          .getQuickRechargeData(token, subsId,encdvcId )
          .then((respose) {
        //setState(() => _isLoading = false);
        setState(() {
          if (respose.status == 1) {

            mostRecentQuickRechargeSubscriptionList = respose.rechargeInfo.mostRecentQuickRechargeSubscriptionList;
            productInfoQuickRechargeSubscription = respose.rechargeInfo.productInfoQuickRechargeSubscription;

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