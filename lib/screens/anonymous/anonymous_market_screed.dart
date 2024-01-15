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
    return const Center(
      child: Text("Anonymous Market"),
    );
  }
}
