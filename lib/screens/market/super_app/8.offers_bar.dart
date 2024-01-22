import 'package:flutter/cupertino.dart';

import '../../../components/users/users.dart';

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
    return const Center(
      child: Text("Offers Bar"),
    );
  }
}
