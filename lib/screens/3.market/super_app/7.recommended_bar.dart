import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/commodities/commoditiesCards.dart';
import '../../../components/users/users.dart';
import '../../../services/utils.dart';

class RecommendedBar extends StatefulWidget {
  const RecommendedBar({
    super.key,
    required this.user,
  });
  final Users user;
  @override
  State<RecommendedBar> createState() => _RecommendedBarState();
}

class _RecommendedBarState extends State<RecommendedBar> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          const Text(
            "Commodities",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
          ),
          IconButton(
              onPressed: () => Utils.redirectUserOnBuyer(context),
              icon: const Icon(
                Icons.arrow_circle_right,
                size: 20,
              ))
        ],
      ),
      const CommoditiesCards()
    ]);
  }
}
