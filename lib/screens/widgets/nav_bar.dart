import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../global.dart';
import '../../screens/profile/new_email.dart';
import '../../screens/profile/new_password.dart';
import '../../services/utils.dart';
import '../../components/users/users.dart';
import '../profile/preferences.dart';
import '../profile/settings.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, required this.user});
  final Users user;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(
            widget.user.name,
            textAlign: TextAlign.end,
          ),
          accountEmail: Text(widget.user.email),
          // currentAccountPicture: CircleAvatar(
          //   backgroundImage: NetworkImage(widget.user.imageUrl),
          //   radius: 50.4,
          // ),
          decoration: const BoxDecoration(
            color: colorHelp,
            image: DecorationImage(
              image: NetworkImage(
                "https://cdn.pixabay.com/photo/2021/06/01/07/03/sparrow-6300790_960_720.jpg",
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.message),
          title: const Text('Notifications'),
          onTap: () {
            Navigator.of(context).pushNamed("/messages");
          },
        ),
        ListTile(
          leading: const Icon(Icons.favorite_outline_rounded),
          title: const Text('Favorites'),
          onTap: () {
            Navigator.of(context).pushNamed("/favorites");
          },
        ),
        ListTile(
          leading: const Icon(Icons.email_outlined),
          title: const Text('Change Email'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ChangeEmail(user: widget.user);
                },
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.password),
          title: const Text('Change Password'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ChangePassword(user: widget.user);
                },
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Settings(user: widget.user);
                },
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.verified),
          title: const Text('Preferences'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Preferences(user: widget.user);
                },
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout_outlined),
          title: const Text('Logout'),
          onTap: () {
            Utils.removeAllFromLocalStorage();
            Navigator.pushReplacementNamed(context, "/login");
          },
        ),
        ListTile(
          leading: const Icon(Icons.account_balance_outlined),
          title: const Text('About'),
          onTap: () {
            showAboutDialog(
                context: context,
                applicationVersion: '2.0.1',
                applicationIcon: Icon(Icons.add),
                applicationLegalese: 'Blah');
          },
        ),
      ],
    ));
  }
}
