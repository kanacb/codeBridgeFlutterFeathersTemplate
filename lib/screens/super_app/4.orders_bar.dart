import 'package:flutter/cupertino.dart';

class OrdersBar extends StatefulWidget {
  const OrdersBar({super.key});

  @override
  State<OrdersBar> createState() => _OrdersBarState();
}

class _OrdersBarState extends State<OrdersBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Orders Bar"),
    );
  }
}
