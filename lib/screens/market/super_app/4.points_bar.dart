import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../global.dart';

import '../../../components/users/users.dart';

class PointBar extends StatefulWidget {
  const PointBar({
    super.key,
    required this.user,
  });
  final Users user;
  @override
  State<PointBar> createState() => _PointBarState();
}

class _PointBarState extends State<PointBar> {
  List<Map<String, dynamic>> points = [
    {"title": "Balance", "subTitle": "RM1.53", "icon": const Icon(Icons.wallet)},
    {"title": "Recent", "subTitle": "300/lrt", "icon": const Icon(Icons.oil_barrel)},
    {
      "title": "Reorder",
      "subTitle": "Orders",
      "icon": const Icon(Icons.train_rounded)
    },
    {
      "title": "Use Points",
      "subTitle": "1,985",
      "icon": const Icon(Icons.shopping_bag)
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width - 20,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: points.length,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return card(points[index]);
          }),
    );
  }

  Widget card(point) {
    return Card(
        color: Colors.white60,
        margin: const EdgeInsets.all(4.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SizedBox(
            width: 120,
            height: 60,
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        point['title'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                      Text(
                        point['subTitle'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  point['icon'],
                ])));
  }
}
