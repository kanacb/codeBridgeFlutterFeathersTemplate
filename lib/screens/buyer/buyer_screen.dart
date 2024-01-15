import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/users/users.dart';
import '../../components/users/usersMain.dart';
import '../../global.dart';
import '../../messages/messages_screen.dart';
import '../widgets/nav_bar.dart';
import '../widgets/tab_bar.dart';

class BuyerScreen extends StatefulWidget {
  const BuyerScreen({super.key, required this.user});
  final Users user;

  @override
  State<BuyerScreen> createState() => _BuyerScreenState();
}

class _BuyerScreenState extends State<BuyerScreen> {
  int _selectedIndex = 0;
  List<String> image = [
    'https://cdn.pixabay.com/photo/2021/06/01/07/03/sparrow-6300790_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/10/20/10/58/elephant-2870777_960_720.jpg',
    'https://cdn.pixabay.com/photo/2014/09/08/17/32/humming-bird-439364_960_720.jpg',
    'https://cdn.pixabay.com/photo/2018/05/03/22/34/lion-3372720_960_720.jpg',
    'https://cdn.pixabay.com/photo/2021/06/01/07/03/sparrow-6300790_960_720.jpg',
  ];
  List<Map<String, dynamic>> title = [
    {'name': 'Users', 'object': 'users', "screen": const UsersScreen()},
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
        title: const Text("VX Index"),
        backgroundColor: colorPrimary,
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
            icon: const Icon(Icons.notifications_outlined),
            color: colorDanger,
            iconSize: 20,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: title.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return card(image[index], title[index]['name'],
              title[index]['screen'], context);
        },
      ),
      drawer: NavBar(
        user: widget.user,
      ),
      bottomNavigationBar: BottomTabBar(onItemTapped: _onItemTapped, userState: "loggedIn", context2: context,),
    );
  }

  Widget card(String image, String title, screen, BuildContext context) {
    return Card(
      color: Colors.yellow[50],
      elevation: 8.0,
      margin: const EdgeInsets.all(4.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
              image,
              height: MediaQuery.of(context).size.width * (3 / 4),
              width: MediaQuery.of(context).size.width,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return screen;
                  },
                ),
              );
            },
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 38.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
