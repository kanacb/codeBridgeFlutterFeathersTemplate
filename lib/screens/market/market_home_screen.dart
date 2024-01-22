import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vx_oil_futures4/screens/market/super_app/super_app.dart';

import '../../components/businesses/businesses.dart';
import '../../components/users/users.dart';


class MarketHomeScreen extends StatefulWidget {
  const MarketHomeScreen({
    super.key,
    required this.user,
    required this.business
  });

  final Users? user;
  final Businesses? business;

  @override
  State<MarketHomeScreen> createState() => _MarketHomeScreenState();
}

class _MarketHomeScreenState extends State<MarketHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SuperApp(user: widget.user!, business: widget.business!,);
  }
}
