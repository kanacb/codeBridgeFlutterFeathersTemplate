import 'package:flutter/cupertino.dart';

import '../../../components/request4quote/request4quoteCards.dart';
import '../../../components/users/users.dart';

class OrdersBar extends StatefulWidget {
  const OrdersBar({
    super.key,
    required this.user,
  });
  final Users user;
  @override
  State<OrdersBar> createState() => _OrdersBarState();
}

class _OrdersBarState extends State<OrdersBar> {
  @override
  Widget build(BuildContext context) {
    return Request4quoteCards();
  }
}
