import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/businesses/businesses.dart';
import '../../components/users/users.dart';

class MarketActivitiesScreen extends StatefulWidget {
  const MarketActivitiesScreen(
      {super.key, required this.user, required this.business});

  final Users? user;
  final Businesses? business;
  @override
  State<MarketActivitiesScreen> createState() => _MarketActivitiesScreenState();
}

class _MarketActivitiesScreenState extends State<MarketActivitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Market Activities"),
    );
  }
}
