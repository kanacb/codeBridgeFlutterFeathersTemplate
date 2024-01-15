import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnonymousHomeScreen extends StatefulWidget {
  const AnonymousHomeScreen({
    super.key,
  });

  @override
  State<AnonymousHomeScreen> createState() => _AnonymousHomeScreenState();
}

class _AnonymousHomeScreenState extends State<AnonymousHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Anonymous Home"),
    );
  }
}
