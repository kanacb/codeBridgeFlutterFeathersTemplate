import 'package:flutter/cupertino.dart';

class MarketApp extends StatefulWidget {
  const MarketApp({super.key});

  @override
  State<MarketApp> createState() => _MarketAppState();
}

class _MarketAppState extends State<MarketApp> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Market App"),
    );
  }
}
