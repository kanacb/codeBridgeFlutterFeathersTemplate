import 'package:flutter/material.dart';
import 'package:vx_oil_futures4/screens/anonymous/anonymous_trends_screen.dart';
import 'package:vx_oil_futures4/screens/anonymous/welcome_screen.dart';

import 'package:vx_oil_futures4/screens/auth/login_screen.dart';
import '../../components/businesses/businesses.dart';
import '../../components/users/users.dart';
import '../../screens/widgets/tab_bar.dart';
import '../../services/projectServices.dart';
import '../../global.dart';
import '../../services/utils.dart';
import '../admin/admin_screen.dart';
import 'anonymous_home_screen.dart';
import 'anonymous_market_screed.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _hide;
  late final List<Widget> _screens = <Widget>[
    const AnonymousHomeScreen(),
    const AnonymousMarketScreen(),
    const AnonymousTrendsScreen(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "get On Board",
          style: TextStyle(color: Colors.black87),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.login_outlined),
            color: colorWarning,
            iconSize: 24,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const SizedBox(height: 15),
          const Text(projectName),
          const SizedBox(height: 35),
          _screens[_selectedIndex],
        ]),
      ),
      bottomNavigationBar: BottomTabBar(
        onItemTapped: _onItemTapped,
        userState: "",
        context2: context,
      ),
    );
  }

  Future<void> redirectUser() async {
    Map<String, dynamic> local = Utils.getFromLocalStorage();
    Users? user = local['user'];
    Businesses? business = local['business'];

    if (context.mounted) {
      if (business?.businessType == "Owner") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AdminScreen(user: user as Users);
            },
          ),
        );
      } else if (user?.id != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return WelcomeScreen(user: user as Users);
            },
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const LoginScreen();
            },
          ),
        );
      }
    }
  }
}
