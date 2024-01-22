import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/users/users.dart';
import '../../main.dart';


class Billings extends StatefulWidget {
  const Billings({super.key});

  @override
  State<Billings> createState() => _BillingsState();
}

class _BillingsState extends State<Billings> {
  late Users user;

  getUser() async {
    user = await flutterFeathersJS.rest.reAuthenticate();
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Billings for ${user.name}"),
      ),
      body: const Center(
        child: Column(
          children: [Text("bills")],
        ),
      ),
    );
  }
}
