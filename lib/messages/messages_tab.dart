import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'messages_alerts.dart';
import 'messages_chat.dart';

class MessagesTab extends StatefulWidget {
  const MessagesTab({super.key});

  @override
  State<MessagesTab> createState() => _MessagesTabState();
}

class _MessagesTabState extends State<MessagesTab> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Notifications"),
          actions: [
            IconButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed("/groups/create"),
                icon: const Icon(Icons.add))
          ],
        ),
        body: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                const TabBar(
                  labelColor: Colors.amberAccent,
                  unselectedLabelColor: Colors.black45,
                  unselectedLabelStyle: TextStyle(fontSize: 20),
                  labelStyle:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(text: 'Chats'),
                    Tab(text: 'Support'),
                  ],
                ),
                Container(
                    alignment: Alignment.center,
                    height: height - height * .2, //height of TabBarView
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey, width: 0.5))),
                    child: const TabBarView(
                      children: [MessagesChats(), MessagesAlerts()],
                    ))
              ])),
        ));
  }
}
