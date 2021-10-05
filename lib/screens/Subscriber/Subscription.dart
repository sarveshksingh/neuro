import 'package:flutter/material.dart';

class Subscription extends StatefulWidget {
  static const String routeName = '/subscription';

  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  var checkBoxValue;
  final List<String> entries = <String>['A', 'B', 'C'];

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
            textDirection: TextDirection.ltr,
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
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              height: 250,
              child: Expanded(
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
                            showCustomModelBottomSheetChannel();
                          },
                          child: Card(
                            child: Row(
                              children: [
                                Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 25.0, top: 20.0, bottom: 20.0),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    /* ListTile(
                leading: Icon(Icons.wifi),
                title: Text(listItem[index],style: TextStyle(fontSize: 18,color: Colors.grey),),

              ),*/
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
                                      margin:
                                          EdgeInsets.only(left: 15.0, top: 5),
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
                                          left: 5.0, top: 20.0, bottom: 20.0),
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
                                      margin:
                                          EdgeInsets.only(left: 50.0, top: 5.0),
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
                                left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                          ),
                        );
                      }),
                ),
              ),
            ),
            Container(
              height: 490.0,
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
                    height: 180.0,
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
                              textDirection: TextDirection.ltr,
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
                              showCustomModelBottomSheetBasicPackage();
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
                              showCustomModelBottomSheetBasicPackage();
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
                              showCustomModelBottomSheetBasicPackage();
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
                                    Navigator.pop(context);
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
                                    Navigator.pop(context);
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

  void showCustomModelBottomSheetBasicPackage() {
    TextEditingController controller = new TextEditingController();
    final List<Map> myProducts =
        List.generate(200, (index) => {"id": index, "name": "Product $index"})
            .toList();

    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          //the rounded corner is created here.
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60.0), topRight: Radius.circular(60.0)),
        ),
        context: context,
        builder: (context) {
          return Expanded(
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
                  ),
                ),

                Container(
                  height: 500,
                  color: Color(0xFCFCFC),
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: myProducts.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
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
                                        'BASIC WALA',
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
                                      '198 CHANNELS',
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
                                      'Rs 440 / MONTH',
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
                        );
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
}
