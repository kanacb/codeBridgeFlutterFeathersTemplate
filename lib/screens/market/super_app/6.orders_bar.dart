import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/request4quote/request4quoteCards.dart';
import '../../../components/users/users.dart';
import '../../../services/utils.dart';

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
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(width: 10,),
          const Text(
            "Requests for quotes",
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
      const Request4quoteCards()
    ]);
  }
}
