import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../components/users/users.dart';
import '../../messages/messages_tab.dart';
import '../favourites/favourites_page.dart';
import '../widgets/nav_bar.dart';
import '../widgets/tab_bar.dart';
import '../../services/projectServices.dart';
import '../../services/utils.dart';

import '../../global.dart';
import '../1.anonymous/app_bar_title.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.user});
  final Users user;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _hide;
  bool isChecked = false;
  bool isScrollingDown = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _hide = AnimationController(vsync: this, duration: kThemeAnimationDuration);
    _hide.forward();
    super.initState();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.metrics.maxScrollExtent == 0.0) {
      isScrollingDown = true;
      _hide.forward();
    }
    if (notification.depth <= 2) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            if (isScrollingDown) {
              isScrollingDown = false;
            }
            _hide.forward();
          case ScrollDirection.reverse:
            if (!isScrollingDown) {
              isScrollingDown = true;
            }
            _hide.reverse();
          case ScrollDirection.idle:
            if (kDebugMode) {
              print('idle');
            }
            break;
        }
      }
    }
    return false;
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
                      return const FavouritesPage();
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
                      return const MessagesTab();
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
        body: NotificationListener<ScrollNotification>(
          onNotification: (_) {
            _handleScrollNotification(_);
            return false;
          },
          child: buildSingleChildScrollView(),
        ),
        drawer: NavBar(
          user: widget.user,
        ),
        bottomNavigationBar: SizeTransition(
          sizeFactor: _hide,
          child: BottomTabBar(
              onItemTapped: _onItemTapped,
              userState: 'loggedIn',
              selectedIndex: _selectedIndex,
              context2: context),
        ));
  }

  SingleChildScrollView buildSingleChildScrollView() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Column(
          children: [
            const Text(projectName),
            const SizedBox(height: 35),
            Column(
              children: drawServices(),
            )
          ],
        )),
      ),
    );
  }

  List<Widget> drawServices() {
    List<Widget> listOfServices = [];
    for (var service in services.indexed) {
      listOfServices.add(card(service));
    }
    return listOfServices;
  }

  Widget titleName() {
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
            Text(
              widget.user.name,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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

  Widget card((int i, Map<String, dynamic>) service) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.all(4.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              service.$2['name'],
              style: const TextStyle(fontSize: 23),
            )
          ]),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
              images[service.$1 % 4],
              height: MediaQuery.of(context).size.width * (3 / 4) / 4,
              width: MediaQuery.of(context).size.width / 4,
            ),
          ),
        ],
      ),
    );
  }
}
