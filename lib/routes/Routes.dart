import 'package:neurosms/screens/GetPasswordScreen.dart';
import 'package:neurosms/screens/HomeScreen.dart';
import 'package:neurosms/screens/MSOScreen.dart';
import 'package:neurosms/screens/Subscription.dart';
import 'package:neurosms/screens/TransactionHistory.dart';
import 'package:neurosms/screens/login/LoginScreen.dart';

class Routes {
  static const String mso = MSOScreen.routeName;
  static const String login = LoginScreen.routeName;
  static const String home = HomeScreen.routeName;
  static const String forget = GetPasswordScreen.routeName;
  static const String transaction = TransactionHistory.routeName;
  static const String subscription = Subscription.routeName;
  //static const String client = TrademarkReportPage.routeName;
}