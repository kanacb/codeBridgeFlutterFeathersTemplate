import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnonymousMarketScreen extends StatefulWidget {
  const AnonymousMarketScreen({super.key});

  @override
  State<AnonymousMarketScreen> createState() => _AnonymousMarketScreenState();
}

class _AnonymousMarketScreenState extends State<AnonymousMarketScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wallet.png'),
            fit: BoxFit.cover,
          ),
          shape: BoxShape.rectangle,
        ),
        child: SizedBox(
          height: 215,
          width: MediaQuery.of(context).size.width - 30,
        ),
      ),
    );
  }
}
