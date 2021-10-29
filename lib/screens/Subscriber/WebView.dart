import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebView extends StatefulWidget {
  static const String routeName = '/webview';

  @override
  _WebView createState() => _WebView();
}
class _WebView extends State<WebView>
{
  double progress = 0;
  String url = "";
  InAppWebViewController _webViewController;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    url = (prefs.getString('paymentUrl') ?? null);

    // if (_token != null) {
    //   _buildBody(context, _token, _subsId, _encdvcId);
    // }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        key: scaffoldkey,
        appBar: AppBar (
          title: Text('WebView',textDirection: TextDirection.ltr,style: TextStyle(color: Color(0xffFFFFFF)),),
          backgroundColor:Color(0xffDF193E),
          elevation:  0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),

          centerTitle: true,

        ),

        body: Stack(
          children: [
            InAppWebView(
              initialUrl: "http://google.com",
              //initialUrl: url,
              initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                      debuggingEnabled: true,
                      //disableHorizontalScroll: true,
                      //disableVerticalScroll: true,
                      supportZoom: true)),
              onWebViewCreated: (InAppWebViewController controller) {
                _webViewController = controller;
              },
              onLoadStart:
                  (InAppWebViewController controller, String url) {
                setState(() {
                  this.url = url;
                });
              },
              onLoadStop: (InAppWebViewController controller,
                  String url) async {
                setState(() {
                  this.url = url;
                });
              },
              onProgressChanged:
                  (InAppWebViewController controller, int progress) {
                setState(() {
                  this.progress = progress / 100;
                });
              },

            )



          ],


        )
    );

  }

}