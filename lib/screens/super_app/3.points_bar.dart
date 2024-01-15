import 'package:flutter/cupertino.dart';

class PointBar extends StatefulWidget {
  const PointBar({super.key});

  @override
  State<PointBar> createState() => _PointBarState();
}

class _PointBarState extends State<PointBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Points Bar"),
    );
  }
}
