import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../messages/messages_tab.dart';
import '../../services/utils.dart';
import 'admin_activities_screen.dart';
import 'admin_home_screen.dart';
import 'admin_management_screen.dart';
import 'admin_market_screed.dart';
import 'admin_trends_screen.dart';
import '../../components/users/users.dart';
import '../../global.dart';
import '../widgets/nav_bar.dart';
import '../widgets/tab_bar.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key, required this.user});
  final Users user;

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _screens = <Widget>[
    AdminHomeScreen(user: widget.user),
    AdminManagementScreen(user: widget.user),
    AdminMarketScreen(user: widget.user),
    AdminActivitiesScreen(user: widget.user),
    AdminTrendsScreen(user: widget.user),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userState = Utils.getUserState("admin");

    return Scaffold(
      appBar: AppBar(
        title: Text(userState['title']),
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
      body: _screens[_selectedIndex],
      drawer: NavBar(
        user: widget.user,
      ),
      bottomNavigationBar: BottomTabBar(
        onItemTapped: _onItemTapped,
        userState: "admin",
        selectedIndex: _selectedIndex,
        context2: context,
      ),
    );
  }
}
