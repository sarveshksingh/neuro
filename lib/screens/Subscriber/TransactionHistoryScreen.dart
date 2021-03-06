import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:neurosms/models/BaseModel.dart';
import 'package:neurosms/models/ServerError.dart';
import 'package:neurosms/models/SubsTransactionHistoryResponse.dart';
import 'package:neurosms/retrofit/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:ext_storage/ext_storage.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

import '../Common.dart';
final imgUrl =
    "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf";

var dio = Dio();

class TransactionHistoryScreen extends StatefulWidget {
  static const String routeName = '/transaction';

  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistoryScreen> {
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
            style: TextStyle(color: Color(0xffFFFFFF)),
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
                                Expanded(
                                    child: Text(
                                  "TRANSACTION HISTORY",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Roboto_Bold',
                                      color: Color(0xff333333)),
                                  textAlign: TextAlign.left,
                                )),
                                // SizedBox(width: 123),
                                //
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: new InkWell(
                                    onTap: () {
                                      print('dot Button tapped');
                                    },
                                    // width: 50,
                                    // child: FlatButton(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/dot.png',
                                          width: 5.0,
                                          height: 30.0,
                                        )
                                        //child: Icon(Icons.school)
                                      ],
                                    ),
                                    // onPressed: () {
                                    //   print('dot Btton tapped');
                                    // },
                                    //
                                    // textColor: Color(0xff333333),

                                    //color: Color(0xffFFFFFF),
                                    //color: Colors.transparent,
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
                        Container(
                            // width: 350,
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(color: Colors.white),
                            child: DropdownButton<EList>(
                              value: _serviceType,

                              isExpanded: true,
                              style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 12,
                                  fontFamily: 'Roboto_Regular'),
                              icon: Image.asset(
                                'assets/images/DownArrow.png',
                                width: 15.0,
                                height: 15.0,
                              ),
                              iconSize: 24,
                              elevation: 16,
                              // underline: Container(
                              //   height: 2,
                              //   width: 300,
                              //   color: Colors.black38,
                              // ),
                              onChanged: (EList value) {
                                setState(() {
                                  _serviceType = value;
                                });
                              },
                              items: _serviceTypeList
                                      .map<DropdownMenuItem<EList>>(
                                          (EList value) {
                                    return DropdownMenuItem<EList>(
                                      value: value,
                                      child: Text(value.item),
                                    );
                                  }).toList() ??
                                  [],
                            )),
                        SizedBox(width: 1),
                        Container(
                            // width: 350,
                            height: 40,
                            margin: EdgeInsets.only(top: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            decoration: BoxDecoration(color: Colors.white),
                            child: DropdownButton<EList>(
                              value: _paymentMode,
                              isExpanded: true,
                              icon: Image.asset(
                                'assets/images/DownArrow.png',
                                width: 15.0,
                                height: 15.0,
                              ),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 12,
                                  fontFamily: 'Roboto_Regular'),
                              // underline: Container(
                              //   height: 2,
                              //   width: 300,
                              //   color: Colors.black38,
                              // ),
                              onChanged: (EList newValue) {
                                setState(() {
                                  _paymentMode = newValue;
                                });
                              },
                              items: _paymentmodeList
                                      .map<DropdownMenuItem<EList>>(
                                          (EList value) {
                                    return DropdownMenuItem<EList>(
                                      value: value,
                                      child: Text(value.item),
                                    );
                                  }).toList() ??
                                  [],
                            )),
                        SizedBox(width: 1),
                        SizedBox(
                          // width: 350,
                          child: FlatButton(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  fromDate == '' ? 'From' : fromDate,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontFamily: 'Roboto_Regular'),
                                )),
                                Icon(
                                  Icons.date_range,
                                  color: Color(0xFFE02935),
                                )
                              ],
                            ),
                            onPressed: () {
                              _selectFromDate(context);
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
                          // width: 350,
                          child: FlatButton(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  toDate == '' ? 'To' : toDate,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontFamily: 'Roboto_Regular'),
                                )),
                                Icon(
                                  Icons.date_range,
                                  color: Color(0xFFE02935),
                                )
                              ],
                            ),
                            onPressed: () {
                              _selectToDate(context);
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
                                            fontSize: 12,
                                            fontFamily: 'Open_Sans_Regular'),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    //print('Search button Clicked');
                                    _buildBody(
                                        context,
                                        _token,
                                        _subsWalletId,
                                        _encDvcMapId,
                                        int.parse(_serviceType.value),
                                        int.parse(_paymentMode.value),
                                        fromDate,
                                        toDate);
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
                                            fontSize: 12,
                                            fontFamily: 'Open_Sans_Regular'),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    //print('Reset button Clicked');
                                    _buildBody(context, _token, _subsWalletId,
                                        _encDvcMapId, 0, 0, '', '');
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
                    Expanded(
                        child: Text(
                      totalCount,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto_Medium',
                          color: Color(0xff333333)),
                      textAlign: TextAlign.left,
                    )),
                    // SizedBox(
                    //   height: 30.0,
                    //   child: FlatButton(
                    //     child: Row(
                    //       children: [
                    //         // Image.asset(
                    //         //   'assets/images/pluse.png',
                    //         //   width: 20.0,
                    //         //   height: 20.0,
                    //         // ),
                    //         Text(
                    //           "Download",
                    //           style: TextStyle(
                    //               fontSize: 12,
                    //               fontFamily: 'Open_Sans_Regular'),
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ],
                    //     ),
                    //     onPressed: () {
                    //       print('Download button Clicked');
                    //     },
                    //     textColor: Color(0xffFFFFFF),
                    //     color: Color(0xffDF193E),
                    //     shape: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             style: BorderStyle.solid,
                    //             width: 1.0,
                    //             color: Colors.transparent),
                    //         borderRadius: new BorderRadius.circular(15.0)),
                    //   ),
                    // ),
                    Expanded(
                        child: Container(
                            //width: 10,
                            height: 40,
                            margin: EdgeInsets.only(top: 5),
                            padding: const EdgeInsets.only(right: 0.0),
                            decoration: BoxDecoration(color: Colors.transparent),
                            child: RaisedButton(
                              onPressed: () async {
                                String path =
                                await ExtStorage.getExternalStoragePublicDirectory(
                                    ExtStorage.DIRECTORY_DOWNLOADS);
                                //String fullPath = tempDir.path + "/boo2.pdf'";
                                String fullPath = "$path/test.pdf";
                                print('full path ${fullPath}');
                                print('Download button clicked');
                                download2(dio, imgUrl, fullPath);
                              },
                              color: Color(0xffE02935),
                              child: Text('Download',
                                style:
                                TextStyle(color: Colors.white, fontSize: 15,fontFamily: 'Roboto_Regular'),),
                            ),
                              /*
                            DropdownButton<String>(
                              value: _downloadType,
                              isExpanded: true,
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 12,
                                  fontFamily: 'Roboto_Regular'),
                              onChanged: (String newValue) {
                                setState(() {
                                  _downloadType = newValue;
                                });
                              },
                              items: _downloadTypeList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList() ??
                                  [],
                            )
                            */
                        )),
                  ],
                ),
              ),
            ),

            // List view container Code

            Container(
                /*height: 420,
              child: Expanded(
                child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: _buildTransactionHistoryListView(
                        context, _transactionHistoryList)),
              ),*/
                child: LimitedBox(
                    maxHeight: 400,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Flexible(
                          child: _buildTransactionHistoryListView(
                              context, _transactionHistoryList))
                    ]))),
          ],
        )),
      ),
    );
  }

  Widget _buildTransactionHistoryListView(
      BuildContext context, List<TransactionHistory> transactionHistoryList) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: transactionHistoryList.length,
        itemBuilder: (BuildContext ctx, int index) {
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
                      margin: EdgeInsets.only(left: 15.0, top: 20.0),
                      child: Row(children: [
                        // Container(
                        //   child: Icon(Icons.network_cell),
                        // ),
                        // SizedBox(width: 10,),
                        Container(
                          child: Text('Date',
                              style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 12,
                                  fontFamily: 'Roboto_Medium')),
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
                                fontSize: 12,
                                fontFamily: 'Roboto_Medium'),
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
                                fontSize: 12,
                                fontFamily: 'Roboto_Medium'),
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
                                fontSize: 12,
                                fontFamily: 'Roboto_Medium'),
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
                                fontSize: 12,
                                fontFamily: 'Roboto_Medium'),
                          ),
                        )
                      ]),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(left: 15.0, top: 15.0, bottom: 20.0),
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
                                fontSize: 12,
                                fontFamily: 'Roboto_Medium'),
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
                      margin: EdgeInsets.only(left: 10.0, top: 20.0),
                      child: Row(children: [
                        // Container(
                        //   child: Icon(Icons.network_cell),
                        // ),
                        // SizedBox(width: 20,),
                        Container(
                          child: Text(
                            date,
                            style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 12,
                                fontFamily: 'Roboto_Regular'),
                            textAlign: TextAlign.left,
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
                            serviceName,
                            style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 12.0,
                                fontFamily: 'Roboto_Regular'),
                            textAlign: TextAlign.left,
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
                          child: Text(description,
                              style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 12.0,
                                  fontFamily: 'Roboto_Regular'),
                              textAlign: TextAlign.left),
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
                          child: Text('$refrenceId',
                              style: TextStyle(
                                  color: Color(0xff333333),
                                  fontSize: 12.0,
                                  fontFamily: 'Roboto_Regular'),
                              textAlign: TextAlign.left),
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
                            paymentMode,
                            style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 12.0,
                                fontFamily: 'Roboto_Regular'),
                          ),
                        )
                      ]),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(left: 10.0, top: 15, bottom: 20.0),
                      child: Row(children: [
                        // Container(
                        //   child: Icon(Icons.network_cell),
                        //
                        // ),
                        //SizedBox(width: 10),
                        Container(
                          //margin: EdgeInsets.only(left:10.0,top: 10,bottom: 20.0),
                          child: Text(
                            '$debit',
                            style: TextStyle(
                                color: Color(0xffE02935),
                                fontSize: 12.0,
                                fontFamily: 'Roboto_Regular'),
                          ),
                        ),
                        SizedBox(width: 60),
                        Container(
                          //margin: EdgeInsets.only(left:10.0,top: 10,bottom: 20.0),
                          child: Text(
                            'Credit',
                            style: TextStyle(
                                color: Color(0xff00BE0D),
                                fontSize: 12.0,
                                fontFamily: 'Roboto_Medium'),
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
            margin:
                EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
          );
        });
  }

  DateTime selectedDate = DateTime.now();
  var formatter = new DateFormat('dd-MM-yyyy');

  Future<void> _selectFromDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2025));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked; //formatter.format(picked) as DateTime;
        fromDate = formatter.format(selectedDate);
        //selectedDate = picked;
      });
  }

  Future<void> _selectToDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2025));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked; //formatter.format(picked) as DateTime;
        toDate = formatter.format(selectedDate);
        //selectedDate = picked;
      });
  }

  @override
  void initState() {
    getPermission();
    super.initState();
    _loadUserInfo();
  }

  void getPermission() async {
    print("getPermission");
    Map<PermissionGroup, PermissionStatus> permissions =
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  }

  Future download2(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
      print(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }


  _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = (prefs.getString('token') ?? null);
    _subsWalletId = (prefs.getString('subsWalletId') ?? null);
    _encDvcMapId = (prefs.getString('encDvcMapId') ?? '');
    if (_token != null) {
      _buildBody(context, _token, _subsWalletId, _encDvcMapId, 0, 0, '', '');
    }
  }

  Future<BaseModel<SubsTransactionHistoryResponse>> _buildBody(
      BuildContext context,
      String token,
      String subsWalletId,
      String encDvcMapId,
      int serviceTypeId,
      int paymentMode,
      String from,
      String to) async {
    SubsTransactionHistoryResponse response;
    final apiClient =
        ApiClient(Dio(BaseOptions(contentType: "application/json")));
    try {
      Common().showAlertDialog(context);
      response = await apiClient.getSubsTransactnHistory(
          token,
          subsWalletId,
          '',
          '',
          encDvcMapId,
          transactionTypeId,
          serviceTypeId,
          paymentMode,
          from,
          to);
      Navigator.pop(context);
      setState(() {
        if (response.status == 1) {
          int count = response.transactionInfo.totalCount;
          totalCount = 'Total Records: ' + "$count";
          _serviceTypeList = response.transactionInfo.serviceTypeList;
          _serviceType = _serviceTypeList.first;
          _paymentmodeList = response.transactionInfo.paymentmodeList;
          _paymentMode = _paymentmodeList.first;
          _transactionHistoryList = response.transactionInfo.transactionHistory;
          _buildTransactionHistoryListView(context, _transactionHistoryList);
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
}
