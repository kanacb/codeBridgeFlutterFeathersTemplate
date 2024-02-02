import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vx_oil_futures4/messages/group.dart';
import '../components/users/users.dart';
import '../screens/widgets/loading.dart';
import '../services/utils.dart';
import 'message_tiles.dart';
import 'messages_api.dart';
import 'messages_screen.dart';

class MessagesChats extends StatefulWidget {
  const MessagesChats({super.key});

  @override
  State<MessagesChats> createState() => _MessagesChatsState();
}

class _MessagesChatsState extends State<MessagesChats> {
  var scrollController = ScrollController();
  GroupsAPI groupsAPI = GroupsAPI();
  late bool isLoading;
  List<Group> groups = [];
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

  fetchGroups() {
    setState(() {
      isLoading = true;
    });

    groupsAPI.getGroups().then(
      (response) {
        isLoading = false;
        if (response.errorMessage == null) {
          setState(() {
            groups = response.data!;
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
    fetchGroups();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  isLoading
            ? const LoadingWidget()
            : Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: error == null
                        ? groups.isEmpty
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
                                itemCount: groups.length,
                                itemBuilder: (context, index) =>
                                    GroupTile(group: groups[index]))
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
                ],
              );
  }
}
