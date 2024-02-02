import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/users/users.dart';
import 'super_app/super_logged_in_app.dart';

class LoggedInHomeScreen extends StatefulWidget {
  final Users user;
  const LoggedInHomeScreen({super.key, required this.user});

  @override
  State<LoggedInHomeScreen> createState() => _LoggedInHomeScreenState();
}

class _LoggedInHomeScreenState extends State<LoggedInHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SuperAnonymousApp(
      user: widget.user,
    );
  }
}
