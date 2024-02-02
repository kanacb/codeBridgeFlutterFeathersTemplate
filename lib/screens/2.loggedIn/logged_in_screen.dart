import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vx_oil_futures4/components/businesses/businessesCreate.dart';
import '../../components/users/users.dart';
import '../widgets/nav_bar.dart';
import 'logged_in_trends_screen.dart';
import 'package:vx_oil_futures4/screens/auth/login_screen.dart';
import '../../screens/widgets/tab_bar.dart';
import '../../services/projectServices.dart';
import '../../global.dart';
import '../../services/utils.dart';
import 'logged_in_home_screen.dart';
import 'logged_in_market_screen.dart';

class LoggedInScreen extends StatefulWidget {
  const LoggedInScreen({super.key, required this.user});
  final Users user;
  @override
  State<LoggedInScreen> createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _hide;
  bool isChecked = false;
  bool isScrollingDown = false;
  late final List<Widget> _screens = <Widget>[
     LoggedInHomeScreen(user: widget.user,),
    const LoggedInMarketScreen(),
    const LoggedInTrendsScreen(),
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
                    return const BusinessesDialogCreate();
                  },
                ),
              );
            },
            icon: const Icon(Icons.account_balance),
            color: colorWarning,
            iconSize: 24,
          ),
        ],
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (_) {
          _handleScrollNotification(_);
          return false;
        },
        child: AnonymousBody(screens: _screens, selectedIndex: _selectedIndex),
      ),
      drawer: NavBar(
        user: widget.user,
      ),
      bottomNavigationBar: SizeTransition(
        sizeFactor: _hide,
        child: BottomTabBar(
          onItemTapped: _onItemTapped,
          userState: "",
          selectedIndex: _selectedIndex,
          context2: context,
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class AnonymousBody extends StatelessWidget {
  const AnonymousBody({
    super.key,
    required List<Widget> screens,
    required int selectedIndex,
  })  : _screens = screens,
        _selectedIndex = selectedIndex;

  final List<Widget> _screens;
  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage('assets/images/anonymous_bg.png'),
          //   fit: BoxFit.fill,
          // ),
          color: Colors.white,
          shape: BoxShape.rectangle,
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/oil-traders.png'),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
            ),
            child: SizedBox(
              height: 85,
              width: MediaQuery.of(context).size.width - 30,
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
                color: colorWarning, fontSize: 21, fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 20,
          ),
          _screens[_selectedIndex],
        ]),
      ),
    );
  }
}
