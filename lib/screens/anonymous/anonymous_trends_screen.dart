import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnonymousTrendsScreen extends StatefulWidget {
  const AnonymousTrendsScreen({super.key});

  @override
  State<AnonymousTrendsScreen> createState() => _AnonymousTrendsScreenState();
}

class _AnonymousTrendsScreenState extends State<AnonymousTrendsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Anonymous Trends"),
    );
  }
}
