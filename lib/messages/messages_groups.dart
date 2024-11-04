import 'package:flutter/cupertino.dart';
import '../components/users/users.dart';

import 'group.dart';
import 'messages_screen.dart';
import 'messages_api.dart';

class MessagesGroups extends StatefulWidget {
  const MessagesGroups({super.key});

  @override
  State<MessagesGroups> createState() => _MessagesGroupsState();
}

class _MessagesGroupsState extends State<MessagesGroups> {
  GroupsAPI groupsAPI = GroupsAPI();
  late bool isLoading;
  List<Group> messages = [];
  String? error;

  var thisUser;
  late Users? user;

  fetchMessages() {
    setState(() {
      isLoading = true;
    });

    groupsAPI.getGroups().then(
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
    return const Placeholder();
  }
}
