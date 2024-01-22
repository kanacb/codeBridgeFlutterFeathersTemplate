import 'package:flutter/cupertino.dart';

import '../../../components/commodities/commoditiesCards.dart';

class CommoditiesAnonymousBar extends StatefulWidget {
  const CommoditiesAnonymousBar({super.key});

  @override
  State<CommoditiesAnonymousBar> createState() => _CommoditiesAnonymousBarState();
}

class _CommoditiesAnonymousBarState extends State<CommoditiesAnonymousBar> {
  @override
  Widget build(BuildContext context) {
    return const CommoditiesCards();
  }
}
