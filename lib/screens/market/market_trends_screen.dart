import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/businesses/businesses.dart';
import '../../components/users/users.dart';

class MarketTrendsScreen extends StatefulWidget {
  const MarketTrendsScreen(
      {super.key, required this.user, required this.business});

  final Users user;
  final Businesses business;
  @override
  State<MarketTrendsScreen> createState() => _MarketTrendsScreenState();
}

class _MarketTrendsScreenState extends State<MarketTrendsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Market Trends"),
    );
  }
}
