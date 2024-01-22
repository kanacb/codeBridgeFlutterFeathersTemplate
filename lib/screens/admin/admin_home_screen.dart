import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/users/users.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key, required this.user});
  final Users user;
  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Admin Home"),
    );
  }
}
