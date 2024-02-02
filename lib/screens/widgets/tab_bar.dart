import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../global.dart';

class BottomTabBar extends StatefulWidget {
   BottomTabBar(
      {super.key,
      required this.onItemTapped,
      required this.userState,
        required this.selectedIndex,
      required this.context2});
  final onItemTapped;
  final String userState;
   int selectedIndex;
  final BuildContext context2;

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    switch (widget.userState) {
      case "loggedIn":
        return loggedIn(widget.context2);
      case "registered":
        return registered(widget.context2);
      case "subscribed":
        return subscribed(widget.context2);
      case "admin":
        return admin(widget.context2);
      default:
        return anonymous(widget.context2);
    }
  }

  Widget anonymous(BuildContext context) {
    return BottomNavigationBar(
      elevation: 3,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: colorPrimary),
        BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange_rounded),
            label: 'Wallet',
            backgroundColor: colorPrimary),
        BottomNavigationBarItem(
          icon: Icon(Icons.line_axis_rounded),
          label: 'Trends',
          backgroundColor: colorPrimary,
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: widget.onItemTapped,
    );
  }

  Widget loggedIn(BuildContext context) {
    return BottomNavigationBar(
      elevation: 3,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: colorPrimary),
        BottomNavigationBarItem(
          icon: Icon(Icons.currency_exchange_rounded),
          label: 'Market',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.line_axis_rounded),
          label: 'Trends',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: widget.onItemTapped,
    );
  }

  Widget registered(BuildContext context) {
    return BottomNavigationBar(
      elevation: 3,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: colorPrimary),
        BottomNavigationBarItem(
            icon: Icon(Icons.ballot_outlined),
            label: 'Activities',
            backgroundColor: colorPrimary),
        BottomNavigationBarItem(
          icon: Icon(Icons.currency_exchange_rounded),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.card_travel_outlined),
            label: 'Transactions',
            backgroundColor: colorPrimary),
        BottomNavigationBarItem(
          icon: Icon(Icons.line_axis_rounded),
          label: 'Trends',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: widget.onItemTapped,
    );
  }

  Widget subscribed(BuildContext context) {
    return BottomNavigationBar(
      elevation: 3,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: colorPrimary),
        BottomNavigationBarItem(
          icon: Icon(Icons.currency_exchange_rounded),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.line_axis_rounded),
          label: 'Trends',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: widget.onItemTapped,
    );
  }

  Widget admin(BuildContext context) {
    return BottomNavigationBar(
      elevation: 3,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: colorPrimary),
        BottomNavigationBarItem(
          icon: Icon(Icons.build_rounded),
          label: 'Admin',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.currency_exchange_rounded),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.currency_exchange_rounded),
          label: 'Activities',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.line_axis_rounded),
          label: 'Trends',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: widget.onItemTapped,
    );
  }
}
