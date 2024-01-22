import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/users/users.dart';
import '../../../global.dart';
import '../../../services/projectServices.dart';

class ServicesBar extends StatefulWidget {
  const ServicesBar({super.key, required this.user});

  final Users user;

  @override
  State<ServicesBar> createState() => _ServicesBarState();
}

class _ServicesBarState extends State<ServicesBar> {
  int loopCount = 3;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buildServices());
  }

  List<Widget> buildServices() {
    List<Widget> serviceAvatar = [];
    services.sort((a,b) => a['order'].compareTo(b['order']));
    for (int i = 0; i < loopCount; i++) {
      serviceAvatar.add(buildServiceAvatar(services[i]));
    }
    return serviceAvatar;
  }

  Widget buildServiceAvatar(Map<String, dynamic> service) {
    return Column(children: [
      CircleAvatar(
        backgroundColor: Colors.cyanAccent,
        foregroundImage: NetworkImage(service['image']),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        service['label'],
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: colorWarning),
      )
    ]);
  }
}
