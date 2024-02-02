import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoggedInMarketScreen extends StatefulWidget {
  const LoggedInMarketScreen({super.key});

  @override
  State<LoggedInMarketScreen> createState() => _LoggedInMarketScreenState();
}

class _LoggedInMarketScreenState extends State<LoggedInMarketScreen> {
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
