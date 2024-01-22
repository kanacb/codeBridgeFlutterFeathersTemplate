import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'market_activities_screen.dart';
import 'market_home_screen.dart';
import 'market_trends_screen.dart';
import 'market_wallet_screen.dart';

import '../../components/businesses/businesses.dart';
import '../../components/users/users.dart';
import '../../global.dart';
import '../../messages/messages_screen.dart';
import '../../services/utils.dart';
import '../widgets/nav_bar.dart';
import '../widgets/tab_bar.dart';
import 'market_transaction_screen.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key, required this.user, required this.business});

  final Users user;
  final Businesses business;

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _screens = <Widget>[
    MarketHomeScreen(user: widget.user, business: widget.business),
    MarketActivitiesScreen(user: widget.user, business: widget.business),
    MarketWalletScreen(user: widget.user, business: widget.business),
    MarketTransactionScreen(user: widget.user, business: widget.business),
    MarketTrendsScreen(user: widget.user, business: widget.business),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userState = Utils.getUserState("registered");
    return Scaffold(
      appBar: AppBar(
        title: Text(userState['header'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 27, color: Colors.white),),
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
      body: _screens[_selectedIndex],
      drawer: NavBar(
        user: widget.user,
      ),
      bottomNavigationBar: BottomTabBar(
        onItemTapped: _onItemTapped,
        userState: "registered",
        context2: context,
      ),
    );
  }
}
