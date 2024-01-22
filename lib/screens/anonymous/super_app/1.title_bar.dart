import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../services/utils.dart';

class AnonymousTitleBar extends StatefulWidget {
  const AnonymousTitleBar({super.key});

  @override
  State<AnonymousTitleBar> createState() => _AnonymousTitleBarState();
}

class _AnonymousTitleBarState extends State<AnonymousTitleBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10,
              height: 10,
            ),
            Text(
              "Good ${Utils.isAfternoon()},",
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(
              width: 3,
            ),
            const Text(
              "Hello Trader",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.ice_skating,
              size: 12,
            ),
            SizedBox(
              width: 5,
            ),
            Text("services", style: TextStyle(fontSize: 12)),
            SizedBox(
              width: 5,
            ),
          ],
        ),
      ],
    );
  }
}
