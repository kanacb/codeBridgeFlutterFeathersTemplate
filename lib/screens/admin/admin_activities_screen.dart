import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/users/users.dart';

class AdminActivitiesScreen extends StatefulWidget {
  const AdminActivitiesScreen({super.key, required this.user});
  final Users user;
  @override
  State<AdminActivitiesScreen> createState() => _AdminActivitiesScreenState();
}

class _AdminActivitiesScreenState extends State<AdminActivitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Admin Activities"),
    );
  }
}
