import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/businesses/businesses.dart';
import '../../components/users/users.dart';

class MarketWalletScreen extends StatefulWidget {
  const MarketWalletScreen(
      {super.key, required this.user, required this.business});

  final Users user;
  final Businesses business;

  @override
  State<MarketWalletScreen> createState() => _MarketWalletScreenState();
}

class _MarketWalletScreenState extends State<MarketWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Wallet Billings"),
    );
  }
}
