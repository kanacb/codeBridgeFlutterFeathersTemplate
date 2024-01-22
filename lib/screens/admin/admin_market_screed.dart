import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/users/users.dart';

class AdminMarketScreen extends StatefulWidget {
  const AdminMarketScreen({super.key, required this.user});
  final Users user;
  @override
  State<AdminMarketScreen> createState() => _AdminMarketScreenState();
}

class _AdminMarketScreenState extends State<AdminMarketScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Admin Market"),
    );
  }
}
