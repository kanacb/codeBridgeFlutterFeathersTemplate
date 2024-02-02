import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../messages/messages_tab.dart';
import 'market_activities_screen.dart';
import 'market_home_screen.dart';
import 'market_trends_screen.dart';
import 'market_wallet_screen.dart';

import '../../components/businesses/businesses.dart';
import '../../components/users/users.dart';
import '../../global.dart';
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

class _MarketScreenState extends State<MarketScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _hide;
  bool isChecked = false;
  bool isScrollingDown = false;

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
    Map<String, dynamic> userState = Utils.getUserState("registered");
    return Scaffold(
        appBar: AppBar(
          title: Text(
            userState['tabs'][_selectedIndex],
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 27, color: Colors.white),
          ),
          backgroundColor: colorPrimary,
          actions: [
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
          child: _screens[_selectedIndex],
        ),
        drawer: NavBar(
          user: widget.user,
        ),
        bottomNavigationBar: SizeTransition(
          sizeFactor: _hide,
          child: BottomTabBar(
            onItemTapped: _onItemTapped,
            userState: "registered",
            selectedIndex: _selectedIndex,
            context2: context,
          ),
        ));
  }
}
