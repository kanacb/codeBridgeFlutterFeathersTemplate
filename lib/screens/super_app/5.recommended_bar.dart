import 'package:flutter/cupertino.dart';

class RecommendedBar extends StatefulWidget {
  const RecommendedBar({super.key});

  @override
  State<RecommendedBar> createState() => _RecommendedBarState();
}

class _RecommendedBarState extends State<RecommendedBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Recommended Bar"),
    );
  }
}
