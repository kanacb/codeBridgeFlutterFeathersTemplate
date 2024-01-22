import 'package:flutter/cupertino.dart';

import '../../../components/commodities/commoditiesCards.dart';
import '../../../components/users/users.dart';

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
    return const CommoditiesCards();
  }
}
