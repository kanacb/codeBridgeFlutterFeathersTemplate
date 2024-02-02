import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/users/users.dart';
import '../../../services/utils.dart';

class OffersBar extends StatefulWidget {
  const OffersBar({
    super.key,
    required this.user,
  });
  final Users user;
  @override
  State<OffersBar> createState() => _OffersBarState();
}

class _OffersBarState extends State<OffersBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Offers",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
            ),
            IconButton(
                onPressed: () => Utils.redirectUserOnBuyer(context),
                icon: const Icon(
                  Icons.arrow_circle_right,
                  size: 20,
                ))
          ],
        ),
        const Center(
          child: Text("Offers Bar"),
        )
      ],
    );
  }
}
