import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './messages/group.dart';
import '../components/users/users.dart';
import '../screens/widgets/loading.dart';
import '../services/utils.dart';
import 'message.dart';
import 'message_tiles.dart';
import 'messages_api.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key, required this.group}) : super(key: key);
  final Group group;

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

  late Users user;
  var thisUser = Utils.getItemFromLocalStorage("user");

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
    if (thisUser != null) {
      user = Users.fromMap(thisUser!);
    }
    isLoading = true;
    fetchMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 15,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/default_user.png"),
                  maxRadius: 12,
                ),
                Text(
                  widget.group.name,
                  style: const TextStyle(fontSize: 15),
                ),
                const Icon(
                  Icons.more_vert_outlined,
                  color: Colors.black,
                ),
              ]),
          centerTitle: true,
        ),
        body: isLoading
            ? const LoadingWidget()
            : Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
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
                                    messages[index].createdBy == user.id
                                        ? SenderMessageTile(
                                            message: messages[index])
                                        : ReceiverMessageTile(
                                            message: messages[index]),
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
                    alignment: Alignment.bottomCenter,
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
                            Message msg = Message(content: controller.text, groupId: widget.group.id!);
                            messagesAPI.createMessage(msg).whenComplete(() {
                              animateList();
                              messages.add(msg);
                              controller.clear();
                              setState(() {});
                            });
                          },
                          onLongPress: () {
                            Message msg = Message(content: controller.text, groupId: widget.group.id!);
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
              ));
  }
}
