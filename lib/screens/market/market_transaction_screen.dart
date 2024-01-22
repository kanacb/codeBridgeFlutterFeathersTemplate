import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/businesses/businesses.dart';
import '../../components/users/users.dart';
import '../../components/users/usersMain.dart';
import '../../global.dart';
import '../../messages/messages_screen.dart';
import '../widgets/nav_bar.dart';
import '../widgets/tab_bar.dart';

class MarketTransactionScreen extends StatefulWidget {
  const MarketTransactionScreen(
      {super.key, required this.user, required this.business});

  final Users user;
  final Businesses business;
  @override
  State<MarketTransactionScreen> createState() =>
      _MarketTransactionScreenState();
}

class _MarketTransactionScreenState extends State<MarketTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Market Transaction"),
    );
  }
}
