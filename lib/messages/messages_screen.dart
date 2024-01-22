import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/users/usersMain.dart';
import '../global.dart';
import '../screens/widgets/loading.dart';
import 'message.dart';
import 'message_tiles.dart';
import 'messages_socketio.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  MessagesScreenState createState() => MessagesScreenState();
}

class MessagesScreenState extends State<MessagesScreen> {
  var controller = TextEditingController();
  var scrollController = ScrollController();
  MessagesAPI messagesAPI = MessagesAPI();
  late bool isLoading;
  List<Message> messages = [];
  String? error;

  void animateList() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.offset !=
          scrollController.position.maxScrollExtent) {
        animateList();
      }
    });
  }

  fetchMessages() {
    setState(() {
      isLoading = true;
    });

    messagesAPI.getMessages().then(
      (response) {
        isLoading = false;
        if (response.errorMessage == null) {
          setState(() {
            messages = response.data!;
          });
        } else {
          setState(() {
            error = response.errorMessage;
          });
        }
      },
    );
  }

  @override
  void initState() {
    isLoading = true;
    fetchMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 12,
        titleSpacing: 10,
        title: const Text(
          'Notifications',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
        ),
        backgroundColor: colorPrimary,
      ),
      body: isLoading
          ? const LoadingWidget()
          : Column(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: error == null
                      ? messages.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Center(
                                child: Text(
                                  "No message for now. Send a new one !",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            )
                          : ListView.builder(
                              controller: scrollController,
                              physics: const BouncingScrollPhysics(),
                              itemCount: messages.length,
                              itemBuilder: (context, index) =>
                                  messages[index].isMe
                                      ? SenderMessageTile(
                                          content: messages[index].content)
                                      : ReceiverMessageTile(
                                          content: messages[index].content),
                            )
                      : Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: Text(
                              error!,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.red),
                            ),
                          ),
                        ),
                ),
                Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextFormField(
                          maxLines: 6,
                          minLines: 1,
                          keyboardType: TextInputType.multiline,
                          controller: controller,
                          onFieldSubmitted: (value) {
                            controller.text = value;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 8),
                            border: InputBorder.none,
                            focusColor: Colors.white,
                            hintText: 'Type a message ...',
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Message msg =
                              Message(content: controller.text, isMe: true);
                          messagesAPI.createMessage(msg).whenComplete(() {
                            animateList();
                            messages.add(msg);
                            controller.clear();
                            setState(() {});
                          });
                        },
                        onLongPress: () {
                          Message msg =
                              Message(content: controller.text, isMe: true);
                          messagesAPI.createMessage(msg).whenComplete(() {
                            animateList();
                            messages.add(msg);
                            controller.clear();
                            setState(() {});
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(bottom: 8, right: 8),
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
