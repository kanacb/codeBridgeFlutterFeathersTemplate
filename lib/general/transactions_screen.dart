import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  var scrollController = ScrollController();
  String? error;
  late String formattedDate;

  @override
  void initState() {
    DateTime now = DateTime.now();
    formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    super.initState();
  }

  List<Map<String, dynamic>> activities = [
    {
      "icon": const CircleAvatar(
        backgroundImage: AssetImage("assets/images/purchased.png"),
      ),
      "title": "Purchase 300/ltr",
      "date": "2024-01-25 – 06:33",
      "action": Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "Reorder",
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 12,
                  ))
            ],
          ))
    },
    {
      "icon": const CircleAvatar(
        backgroundImage: AssetImage("assets/images/purchased.png"),
      ),
      "title": "Purchase 300/ltr",
      "date": "2024-01-25 – 06:33",
      "action": Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Reorder",
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 12,
                  ))
            ],
          ))
    },
    {
      "icon": const CircleAvatar(
        backgroundImage: AssetImage("assets/images/purchased.png"),
      ),
      "title": "Purchase 300/ltr",
      "date": "2024-01-25 – 06:33",
      "action": Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Reorder",
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 12,
                  ))
            ],
          ))
    },
    {
      "icon": const CircleAvatar(
        backgroundImage: AssetImage("assets/images/purchased.png"),
      ),
      "title": "Purchase 300/ltr",
      "date": "2024-01-25 – 06:33",
      "action": Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Reorder",
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 12,
                  ))
            ],
          ))
    },
    {
      "icon": const CircleAvatar(
        backgroundImage: AssetImage("assets/images/purchased.png"),
      ),
      "title": "Purchase 300/ltr",
      "date": "2024-01-25 – 06:33",
      "action": Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Reorder",
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 12,
                  ))
            ],
          ))
    },
    {
      "icon": const CircleAvatar(
        backgroundImage: AssetImage("assets/images/purchased.png"),
      ),
      "title": "Purchase 300/ltr",
      "date": "2024-01-25 – 06:33",
      "action": Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Reorder",
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 12,
                  ))
            ],
          ))
    },
    {
      "icon": const CircleAvatar(
        backgroundImage: AssetImage("assets/images/purchased.png"),
      ),
      "title": "Purchase 300/ltr",
      "date": "2024-01-25 – 06:33",
      "action": Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Reorder",
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 12,
                  ))
            ],
          ))
    },
    {
      "icon": const CircleAvatar(
        backgroundImage: AssetImage("assets/images/purchased.png"),
      ),
      "title": "Purchase 300/ltr",
      "date": "2024-01-25 – 06:33",
      "action": Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Reorder",
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 12,
                  ))
            ],
          ))
    },
    {
      "icon": const CircleAvatar(
        backgroundImage: AssetImage("assets/images/purchased.png"),
      ),
      "title": "Purchase 300/ltr",
      "date": "2024-01-25 – 06:33",
      "action": Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Reorder",
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 12,
                  ))
            ],
          ))
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Text("Recent Activity", textAlign: TextAlign.start, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900), ),
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: activities.isEmpty
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
                  itemCount: activities.length,
                  itemBuilder: (context, index) =>
                      activityTile(activities[index]),
                ),
        )
      ],
    );
  }

  Widget activityTile(activity) {
    return Card(
        child: ListTile(
      leading: activity['icon'],
      visualDensity: VisualDensity.comfortable,
      title: Wrap(alignment: WrapAlignment.start, children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Text(
            activity['title'],
            textAlign: TextAlign.left,
            style: const TextStyle(color: Colors.white),
            softWrap: true,
          ),
        ),
      ]),
      subtitle: Padding(
        padding: const EdgeInsets.only(right: 8, top: 4),
        child: Text(
          activity['date'],
          textAlign: TextAlign.right,
          style: const TextStyle(fontSize: 10),
        ),
      ),
      trailing: activity['action'],
    ));
  }
}
