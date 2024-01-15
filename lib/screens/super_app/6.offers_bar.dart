import 'package:flutter/cupertino.dart';

class OffersBar extends StatefulWidget {
  const OffersBar({super.key});

  @override
  State<OffersBar> createState() => _OffersBarState();
}

class _OffersBarState extends State<OffersBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Offers Bar"),
    );
  }
}
