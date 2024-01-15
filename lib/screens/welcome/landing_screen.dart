import 'package:flutter/material.dart';
import '../../components/users/users.dart';
import '../../components/users/usersMain.dart';
import '../../messages/messages_screen.dart';
import '../../screens/widgets/nav_bar.dart';
import '../../screens/widgets/tab_bar.dart';
import '../../services/utils.dart';


import '../../global.dart';
import 'app_bar_title.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _screens = <Widget>[

// trends
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(),
        backgroundColor: colorSecondary,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MessagesScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.favorite_outline),
            color: colorDanger,
            iconSize: 20,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MessagesScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.notifications_outlined),
            color: colorDanger,
            iconSize: 20,
          ),
        ],
      ),
      body: const Center(
        child: Text("Start here"),
      ),
      bottomNavigationBar: BottomTabBar(onItemTapped: _onItemTapped),
    );
  }

  Widget title_name() {
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

  Widget card(String image, String title, BuildContext context) {
    return Card(
      color: Colors.greenAccent,
      elevation: 8.0,
      margin: const EdgeInsets.all(4.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              title,
              style: const TextStyle(fontSize: 12),
            ),
            const Text("RM 3.15/liter",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ]),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
              image,
              height: MediaQuery.of(context).size.width * (3 / 4) / 4,
              width: MediaQuery.of(context).size.width / 4,
            ),
          ),
        ],
      ),
    );
  }
}
