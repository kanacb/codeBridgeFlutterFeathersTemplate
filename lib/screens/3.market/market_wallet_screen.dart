import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/businesses/businesses.dart';
import '../../components/users/users.dart';

class MarketWalletScreen extends StatefulWidget {
  const MarketWalletScreen(
      {super.key, required this.user, required this.business});

  final Users user;
  final Businesses business;

  @override
  State<MarketWalletScreen> createState() => _MarketWalletScreenState();
}

class _MarketWalletScreenState extends State<MarketWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(0, 20, 30, 0),
        decoration: BoxDecoration(
          color: const Color(0xff7c94b6),
          image: const DecorationImage(
            image: AssetImage('assets/images/leaf.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Your money is save with us",
              style: TextStyle(fontSize: 17),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_circle_right,
                  size: 20,
                )),
            const Card(
                color: Colors.green,
                child: Expanded(
                  flex: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "VX FinPay Wallet",
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        "RM 103.0",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
