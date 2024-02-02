import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/businesses/businesses.dart';
import '../../components/users/users.dart';
import '../../general/transactions_screen.dart';

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
    return const TransactionsScreen();
  }
}
