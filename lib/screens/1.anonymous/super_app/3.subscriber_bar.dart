import 'dart:async';

import 'package:animated_flip_widget/animated_flip_widget/flip_controler.dart';
import 'package:animated_flip_widget/animated_flip_widget/flip_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubscribeAnonymousBar extends StatefulWidget {
  const SubscribeAnonymousBar({super.key});

  @override
  State<SubscribeAnonymousBar> createState() => _SubscribeAnonymousBarState();
}

class _SubscribeAnonymousBarState extends State<SubscribeAnonymousBar> {
  final controller = FlipController();
  FlipDirection direction = FlipDirection.vertical;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    const oneSec = Duration(seconds: 4);
    Timer.periodic(oneSec, (Timer t) => controller.flip());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedFlipWidget(
      front: const SubscribeWidget(),
      back: const Request4Quote(),
      flipDirection: direction,
      controller: controller,
      clickable: false,
    );
  }
}

class SubscribeWidget extends StatelessWidget {
  const SubscribeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width - 20,
            padding: EdgeInsets.zero,
            alignment: Alignment.topLeft,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/subscribe.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Row(children: [
              const Text("Subscribe Now",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
              IconButton(
                  onPressed: () => Navigator.of(context).pushNamed("/login"),
                  icon: const Icon(
                    Icons.arrow_circle_right,
                    size: 20,
                  ))
            ])),
        onTap: () => Navigator.of(context).pushNamed("/login"));
  }
}

class Request4Quote extends StatelessWidget {
  const Request4Quote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            height: 200,
            padding: EdgeInsets.zero,
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width - 20,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/buyoil.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: Row(children: [
              const Text(
                "Login Now",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
              ),
              IconButton(
                  onPressed: () => Navigator.of(context).pushNamed("/login"),
                  icon: const Icon(
                    Icons.arrow_circle_right,
                    size: 20,
                  ))
            ])),
        onTap: () => Navigator.of(context).pushNamed("/login"));
  }
}
