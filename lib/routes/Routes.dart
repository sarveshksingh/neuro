import 'package:neurosms/screens/AccountScreen.dart';
import 'file:///D:/Sarvesh/Flutter/neurosms/lib/screens/Subscriber/GetPasswordScreen.dart';
import 'file:///D:/Sarvesh/Flutter/neurosms/lib/screens/Subscriber/HomeScreen.dart';
import 'file:///D:/Sarvesh/Flutter/neurosms/lib/screens/Subscriber/MSOScreen.dart';
import 'file:///D:/Sarvesh/Flutter/neurosms/lib/screens/Subscriber/Subscription.dart';
import 'file:///D:/Sarvesh/Flutter/neurosms/lib/screens/Subscriber/TransactionHistoryScreen.dart';
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