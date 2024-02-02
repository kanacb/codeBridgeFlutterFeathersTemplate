import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/commodities/commoditiesCards.dart';
import '../../../services/utils.dart';

class CommoditiesAnonymousBar extends StatefulWidget {
  const CommoditiesAnonymousBar({super.key});

  @override
  State<CommoditiesAnonymousBar> createState() =>
      _CommoditiesAnonymousBarState();
}

class _CommoditiesAnonymousBarState extends State<CommoditiesAnonymousBar> {
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
