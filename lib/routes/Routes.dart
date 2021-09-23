import 'package:neurosms/screens/AccountScreen.dart';
import 'package:neurosms/screens/GetPasswordScreen.dart';
import 'package:neurosms/screens/HomeScreen.dart';
import 'package:neurosms/screens/MSOScreen.dart';
import 'package:neurosms/screens/Subscription.dart';
import 'package:neurosms/screens/TransactionHistoryScreen.dart';
import 'package:neurosms/screens/login/LoginScreen.dart';

class Routes {
  static const String mso = MSOScreen.routeName;
  static const String login = LoginScreen.routeName;
  static const String home = HomeScreen.routeName;
  static const String forget = GetPasswordScreen.routeName;
  static const String transaction = TransactionHistoryScreen.routeName;
  static const String subscription = Subscription.routeName;
  static const String account = AccountScreen.routeName;
}