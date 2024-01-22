import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/users/users.dart';

class AdminTrendsScreen extends StatefulWidget {
  const AdminTrendsScreen({super.key, required this.user});
  final Users user;
  @override
  State<AdminTrendsScreen> createState() => _AdminTrendsScreenState();
}

class _AdminTrendsScreenState extends State<AdminTrendsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Admin Trends"),
    );
  }
}
