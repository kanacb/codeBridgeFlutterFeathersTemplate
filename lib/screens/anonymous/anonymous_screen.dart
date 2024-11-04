import 'package:flutter/material.dart';
import '../../screens/anonymous/anonymous_trends_screen.dart';
import '../../screens/anonymous/welcome_screen.dart';

import '../../screens/auth/login_screen.dart';
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
    Map<String, dynamic> currentState = Utils.getUserState("anonymous");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentState['header'],
          style: const TextStyle(color: Colors.black87),
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
        child: Container(
          decoration: const BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage('assets/images/anonymous_bg.png'),
            //   fit: BoxFit.fill,
            // ),
            color: Colors.white,
            shape: BoxShape.rectangle,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 15,),
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/oil-traders.png'),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 85,
                        width: MediaQuery.of(context).size.width - 30,
                      ),

                    ],
                  ),
                ),
                const Text(
                  projectDescription,
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
                const SizedBox(
                  height: 20,
                ),

                const Text(
                  projectName,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: colorWarning,
                      fontSize: 21,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 20,
                ),
                _screens[_selectedIndex],
              ]),
        ),
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
