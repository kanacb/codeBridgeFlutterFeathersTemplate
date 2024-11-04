import 'package:moment_dart/moment_dart.dart';

import './message.dart';
import 'package:flutter/material.dart';
import './messages_screen.dart';
import '../services/utils.dart';
import 'messages_chat.dart';

class ReceiverMessageTile extends StatelessWidget {
  ReceiverMessageTile({Key? key, required this.message}) : super(key: key);

  var thisUser = Utils.getItemFromLocalStorage("user");
  final Message message;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/images/default_user.png"),
        ),
      ),
      title: Wrap(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Text(
              message.content,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      trailing: const SizedBox(width: 50),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 8, top: 4),
        child: Text(
            DateTime.now().toMoment().fromNow(),
            style: const TextStyle(fontSize: 10)),
      ),
    );
  }
}

class SenderMessageTile extends StatelessWidget {
  const SenderMessageTile({Key? key, required this.message}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const SizedBox(width: 50),
      visualDensity: VisualDensity.comfortable,
      title: Wrap(alignment: WrapAlignment.end, children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Text(
            message.content,
            textAlign: TextAlign.left,
            style: const TextStyle(color: Colors.white),
            softWrap: true,
          ),
        ),
      ]),
      subtitle: Padding(
        padding: const EdgeInsets.only(right: 8, top: 4),
        child: Text(
          message.date != null ? message.date!.toMoment().fromNow() : "",
          textAlign: TextAlign.right,
          style: const TextStyle(fontSize: 10),
        ),
      ),
      // trailing: CircleAvatar(
      //   backgroundImage: NetworkImage(users.image),
      // ),
    );
  }
}

class GroupTile extends StatelessWidget {
  const GroupTile({Key? key, required this.group}) : super(key: key);
  final Group group;

  @override
  Widget build(BuildContext context) {
    String createdDate = group.createdDate.toMoment().fromNow();
    gotoChat() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MessagesScreen(group: group);
          },
        ),
      );
    }

    return GestureDetector(
        onTap: () => gotoChat(),
        child: Card(
            child: ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage("assets/images/default_user.png"),
          ),
          visualDensity: VisualDensity.comfortable,
          title: Wrap(alignment: WrapAlignment.start, children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                group.name,
                textAlign: TextAlign.left,
                softWrap: true,
              ),
            ),
            Text(
              group.topic,
              textAlign: TextAlign.end,
              softWrap: true,
            ),
          ]),
          subtitle: Padding(
            padding: const EdgeInsets.only(right: 8, top: 4),
            child: Text(
              createdDate,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 10),
            ),
          ),
          // trailing: CircleAvatar(
          //   backgroundImage: NetworkImage(users.image),
          // ),
        )));
  }
}
