import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/users/users.dart';

class AnonymousTrendsScreen extends StatefulWidget {
  const AnonymousTrendsScreen({super.key, required this.user});
  final Users user;
  @override
  State<AnonymousTrendsScreen> createState() => _AnonymousTrendsScreenState();
}

class _AnonymousTrendsScreenState extends State<AnonymousTrendsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Admin Billings"),
    );
  }
}
