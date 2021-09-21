import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:neurosms/models/SubsDashboardResponse.dart';
import 'package:neurosms/retrofit/api_client.dart';
import 'package:neurosms/screens/Subscription.dart';
import 'package:neurosms/screens/TransactionHistoryScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import 'AppDrawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HardwareDetailsList> _hardwareDetailsList = [];
  List<SubscriptionList> _subscriptionList = [];
  int _selectedIndex = 0;
  String _token,
      userName = '',
      companyName = '',
      contactNumber = '',
      email = '',
      logoPath = '',
      logo;
  double currentBalance = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
              brightness: Brightness.light,
              elevation: 0.0,
              title: new Text('Dashboard'))),
      backgroundColor: Color(0xffDF1D3B),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //Container(height: 100, color: Colors.red),
            //Expanded(
            //child:
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  _buildUserCard(),
                  _buildActivtCard(),
                  //_buildInactiveCard()
                ],
              ),
            )
            //),
          ],
        ),
      ),
      //body: _homePage(),
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? SvgPicture.asset('assets/images/home.svg',
                    color: Color(0xffDF1D3B))
                : SvgPicture.asset(
                    'assets/images/home.svg',
                  ),
            label: 'Home',
            //backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? SvgPicture.asset('assets/images/profile.svg',
                    color: Color(0xffDF1D3B))
                : SvgPicture.asset(
                    'assets/images/profile.svg',
                  ),
            label: 'Billing',
            //backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? SvgPicture.asset('assets/images/user.svg',
                    color: Color(0xffDF1D3B))
                : SvgPicture.asset(
                    'assets/images/user.svg',
                  ),
            label: 'Account',
            //backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? SvgPicture.asset('assets/images/support.svg',
                    color: Color(0xffDF1D3B))
                : SvgPicture.asset('assets/images/support.svg'),
            label: 'Support',
            //backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        //selectedItemColor: Color(0xffDF193E),
        unselectedItemColor: Color(0xff515353),
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildUserCard() => new Container(
      child: new Card(
          elevation: 8.0,
          margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child: new InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      //builder: (context) => TimesheetPage()
                      ),
                );
              },
              child: Container(
                  margin:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                  child: Column(children: [
                    Row(
                      children: [
                        Container(
                          width: 57,
                          height: 57,
                          margin: EdgeInsets.only(right: 13.0),
                          decoration: BoxDecoration(
                              //color: Colors.red,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/images/bank.png')
                                  /*image: logo == ''
                                    ? Image.asset('assets/images/bank.png')
                                    : NetworkImage(logoPath +
                                    logo), */ //NetworkImage(logoPath)
                                  ),
                              borderRadius: BorderRadius.circular(57.0)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 10.0),
                                child: new Text(
                                  companyName,
                                  style: TextStyle(
                                    color: Color(0xffDF1D3B),
                                    fontSize: 14,
                                    fontFamily: 'Roboto_Bold',
                                    //fontWeight: FontWeight.bold
                                  ),
                                )),
                            Container(
                                margin: EdgeInsets.only(top: 5.0),
                                child: new Text(
                                  contactNumber,
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 12,
                                    fontFamily: 'Roboto_Medium',
                                    //fontWeight: FontWeight.normal
                                  ),
                                )),
                            Row(children: [
                              Container(
                                  margin:
                                      EdgeInsets.only(top: 5.0, bottom: 10.0),
                                  child: new Text(
                                    'Email:',
                                    style: TextStyle(
                                      color: Color(0xff808080),
                                      fontSize: 12,
                                      fontFamily: 'Roboto_Regular',
                                      //fontWeight: FontWeight.normal
                                    ),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(
                                      left: 10.0, top: 5.0, bottom: 10.0),
                                  child: new Text(
                                    email,
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 12,
                                      fontFamily: 'Roboto_Medium',
                                    ),
                                  ))
                            ])
                          ],
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          margin: EdgeInsets.only(right: 13.0),
                          decoration: BoxDecoration(
                              //color: Colors.red,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage('assets/images/wallet.png')),
                              borderRadius: BorderRadius.circular(35.0)),
                        ),
                        Container(
                            child: Expanded(
                                child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 10.0),
                                child: new Text(
                                  'Current Balance',
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 12,
                                    fontFamily: 'Roboto_Light',
                                  ),
                                )),
                            Container(
                                margin: EdgeInsets.only(bottom: 5.0),
                                child: new Text(
                                  '\u20B9 ${currentBalance}',
                                  style: TextStyle(
                                    //color: Colors.green,
                                    color: currentBalance > 0
                                        ? Color(0xff227700)
                                        : Color(0xffDF1D3B),
                                    fontSize: 14,
                                    fontFamily: 'Roboto_Bold',
                                  ),
                                )),
                          ],
                        ))),
                        Container(
                            child: new InkWell(
                                onTap: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  /*Toast.show("Transaction Click", context,
                                      duration: Toast.LENGTH_SHORT,
                                      gravity: Toast.BOTTOM);*/
                                  prefs.setString('encDvcMapId', '');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TransactionHistoryScreen()),
                                  );
                                  /*Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      Routes.transaction,
                                      ModalRoute.withName(Routes.transaction));*/
                                },
                                child: Row(children: [
                                  Container(
                                      margin: EdgeInsets.only(left: 40.0),
                                      padding: EdgeInsets.all(10.0),
                                      child: new Text(
                                        'VIEW TRANSACTION',
                                        style: TextStyle(
                                          color: Color(0xffDF1D3B),
                                          fontSize: 12,
                                          fontFamily: 'Lato_Regular',
                                        ),
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: SvgPicture.asset(
                                          'assets/images/next.svg',
                                          color: Color(0xffDF1D3B))),
                                ]))),
                      ],
                    )
                  ])))));

  Widget _buildActivtCard() => new Container(
      child: Container(
          //height: 550,
          margin: EdgeInsets.only(bottom: 12.0),
          /*child: _buildListView(context, _hardwareDetailsList)),*/
          child: LimitedBox(
              maxHeight: 600,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Flexible(child: _buildListView(context, _hardwareDetailsList))
              ]))));

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = (prefs.getString('token') ?? null);
    if (_token != null) {
      /*Navigator.pushNamedAndRemoveUntil(
          context, Routes.login, ModalRoute.withName(Routes.login));
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.home, ModalRoute.withName(Routes.home));*/
      _buildBody(context, _token);
    }
  }

  Future<FutureBuilder<SubsDashboardResponse>> _buildBody(
      BuildContext context, String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<SubsDashboardResponse>(
      future: client.getSubsDashboard(token).then((respose) {
        //setState(() => _isLoading = false);
        setState(() {
          if (respose.status == 1) {
            logoPath = respose.logoPath;
            prefs.setString('User_ID', respose.dashboardinfo.userDetail.userId);

            prefs.setString('subsWalletId',
                respose.dashboardinfo.subscriberProfile.walletId);
            userName = respose.dashboardinfo.subscriberProfile.subscriberName;
            prefs.setString('Name', userName);
            companyName =
                respose.dashboardinfo.subscriberProfile.mainAccountName;
            contactNumber = respose.dashboardinfo.subscriberProfile
                .subscriberProfileAddress.phoneNo;
            email = respose.dashboardinfo.subscriberProfile.subscriberEmail;
            currentBalance = respose
                .dashboardinfo.subscriberProfile.subscriberTotalWalletBalance;
            prefs.setDouble('balance', currentBalance);
            Toast.show("Get Dashboard Data successfully", context,
                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
            _hardwareDetailsList = respose.dashboardinfo.hardwareDetailsList;
            _buildListView(context, _hardwareDetailsList);
            //loadProgress();
            /*SharedPreferences pref = await SharedPreferences.getInstance();
            pref.setBool('Login', true);
            pref.setString("Branch", respose.Branch);
            pref.setString("Name", respose.Name);
            pref.setString("Image_Path", respose.Image_Path);
            pref.setString("User_ID", respose.User_ID);
            pref.setString("Deligated_ByName", respose.Deligated_ByName);
            pref.setString("Deligated_By", respose.Deligated_By);
            pref.setString("Department", respose.Department);
            pref.setString("M_app_key", respose.M_App_Key);*/
            // Navigator.pushNamedAndRemoveUntil(
            //     context, Routes.home, ModalRoute.withName(Routes.home));
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

  Widget _buildListView(
      BuildContext context, List<HardwareDetailsList> _hardwareDetailsList) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        _subscriptionList =
            _hardwareDetailsList.elementAt(index).hardsubscriptionList;
        String statusValue =
            _hardwareDetailsList.elementAt(index).hardwareStatusValue;
        String encDvcMapId = _hardwareDetailsList.elementAt(index).encDvcMapId;
        return Card(
            elevation: 8.0,
            margin: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
            child: Container(
                margin: EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 12.0, top: 10.0),
                child: Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Container(
                          child: Row(children: [
                        new Text(
                          statusValue,
                          style: TextStyle(
                            color: statusValue == 'Active'
                                ? Color(0xff227700)
                                : Color(0xffDF1D3B),
                            fontSize: 12,
                            fontFamily: 'Roboto_Regular',
                          ),
                        )
                      ])),
                      Container(
                          margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
                          child: Row(children: [
                            Container(
                                //margin: EdgeInsets.only(bottom: 10.0),
                                child: new Text(
                              'STB:',
                              style: TextStyle(
                                color: Color(0xff333333),
                                fontSize: 12,
                                fontFamily: 'Roboto_Medium',
                              ),
                            )),
                            Container(
                                margin: EdgeInsets.only(left: 10.0),
                                child: new Text(
                                  _hardwareDetailsList.elementAt(index).stbVcNo,
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 12,
                                    fontFamily: 'Roboto_Medium',
                                  ),
                                ))
                          ])),
                      Container(
                          child: new InkWell(
                              onTap: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                /* Toast.show("Transaction Click", context,
                                    duration: Toast.LENGTH_SHORT,
                                    gravity: Toast.BOTTOM);*/
                                prefs.setString('encDvcMapId', encDvcMapId);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TransactionHistoryScreen()),
                                );
                                /*Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    Routes.transaction,
                                    ModalRoute.withName(Routes.transaction));*/
                              },
                              child: Row(children: [
                                Container(
                                    //margin: EdgeInsets.only(left: 40.0),
                                    padding: EdgeInsets.all(5.0),
                                    child: new Text(
                                      'VIEW TRANSACTION',
                                      style: TextStyle(
                                        color: Color(0xffDF1D3B),
                                        fontSize: 12,
                                        fontFamily: 'Lato_Regular',
                                      ),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: SvgPicture.asset(
                                        'assets/images/next.svg',
                                        color: Color(0xffDF1D3B))),
                              ]))),
                      Container(
                          child: Row(
                        children: [
                          //Expanded(
                          // child:
                          Container(
                              margin: EdgeInsets.only(
                                  bottom: 10.0, top: 10.0, right: 10.0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffDF1D3B)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: new InkWell(
                                  onTap: () {
                                    /*Toast.show("Subscription Click", context,
                                        duration: Toast.LENGTH_SHORT,
                                        gravity: Toast.BOTTOM);*/
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Subscription()),
                                    );
                                    /*Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        Routes.subscription,
                                        ModalRoute.withName(
                                            Routes.subscription));*/
                                  },
                                  child: Row(children: [
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: 5.0,
                                            bottom: 10.0,
                                            top: 10.0,
                                            right: 5.0),
                                        child: new Text(
                                          'SUBSCRIPTION',
                                          style: TextStyle(
                                            color: Color(0xffDF1D3B),
                                            fontSize: 12,
                                            fontFamily: 'Lato_Regular',
                                          ),
                                        )),
                                    Container(
                                        margin: EdgeInsets.only(right: 5.0),
                                        child: SvgPicture.asset(
                                            'assets/images/group75171.svg',
                                            color: Color(0xffDF1D3B))),
                                  ]))),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffDF1D3B)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: new InkWell(
                                  onTap: () {
                                    Toast.show("Transaction Click", context,
                                        duration: Toast.LENGTH_SHORT,
                                        gravity: Toast.BOTTOM);
                                    /*Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        //builder: (context) => TimesheetPage()
                                        ),
                                  );*/
                                  },
                                  child: Row(children: [
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: 5.0,
                                            bottom: 10.0,
                                            top: 10.0,
                                            right: 5.0),
                                        child: new Text(
                                          'QUICK RECHARGE',
                                          style: TextStyle(
                                            color: Color(0xffDF1D3B),
                                            fontSize: 12,
                                            fontFamily: 'Lato_Regular',
                                          ),
                                        )),
                                    Container(
                                        margin: EdgeInsets.only(right: 5.0),
                                        child: SvgPicture.asset(
                                            'assets/images/group75171.svg',
                                            color: Color(0xffDF1D3B))),
                                  ])))
                        ],
                      )),
                      LimitedBox(
                          maxHeight: 150,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                    child: _buildSubscriptionListView(
                                        context, _subscriptionList))
                              ]))
                    ]))));
      },
      itemCount: _hardwareDetailsList.length, //posts.data.length,
    );
  }

  Widget _buildSubscriptionListView(
      BuildContext context, List<SubscriptionList> hardsubscriptionList) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        logo = hardsubscriptionList.elementAt(index).logo;
        DateTime startDate = hardsubscriptionList.elementAt(index).startDate;
        DateTime endDate = hardsubscriptionList.elementAt(index).endDate;
        DateTime now = DateTime.now();

        String productName = hardsubscriptionList.elementAt(index).productName;
        String formattedDate = DateFormat('dd-MMM-yyyy').format(startDate);
        final difference = endDate.difference(now).inDays;
        String expire = 'Expires in ' + difference.toString() + ' days';
        bool isActive = hardsubscriptionList.elementAt(index).isActive;

        String alert = isActive ? 'Active' : 'In Active';

        return Card(
            elevation: 3.0,
            //margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  //margin: EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10.0, right: 10),
                        padding: EdgeInsets.all(5.0),
                        //child: Image.asset('assets/images/Group7536.png')
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              //color: Colors.red,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                //image: AssetImage('assets/images/bank.png')
                                //image: SvgPicture.asset('assets/images/bank.svg')
                                image: logo == ''
                                    ? Image.asset('assets/images/Group7536.png')
                                    : NetworkImage(logoPath +
                                        logo), //NetworkImage(logoPath)
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          //child: Image.asset('assets/images/bank.png')
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                productName, //'BASICS',//productName
                                style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 12,
                                    fontFamily: 'Roboto_Medium'),
                              ),
                              Text(
                                formattedDate, //'15-Aug-2021',
                                style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 12,
                                    fontFamily: 'Roboto_Regular'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                expire,
                                style: TextStyle(
                                    color: Color(0xff808080),
                                    fontSize: 10,
                                    fontFamily: 'Roboto_Regular'),
                              ),
                              Text(
                                alert,
                                style: TextStyle(
                                    color: isActive
                                        ? Color(0xff227700)
                                        : Color(0xffDF1D3B),
                                    fontSize: 12,
                                    fontFamily: 'Roboto_Regular'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
      },
      itemCount: hardsubscriptionList.length, //posts.data.length,
    );
  }
}
