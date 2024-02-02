import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/commodities/commoditiesCards.dart';
import '../../../services/utils.dart';

class CommoditiesLoggedInBar extends StatefulWidget {
  const CommoditiesLoggedInBar({super.key});

  @override
  State<CommoditiesLoggedInBar> createState() =>
      _CommoditiesLoggedInBarState();
}

class _CommoditiesLoggedInBarState extends State<CommoditiesLoggedInBar> {
  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      Row(
        children: [
          const SizedBox(width: 10,),
          const Text(
            "Commodities",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
          ),
          IconButton(
              onPressed: () => Utils.redirectUserOnBuyer(context),
              icon:  const Icon(
                Icons.arrow_circle_right,
                size: 20,
              ))
        ],
      ),
      const CommoditiesCards()
    ]);
  }
}
