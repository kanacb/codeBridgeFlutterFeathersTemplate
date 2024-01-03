import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vx_index/businesses/businessesService.dart';
import 'package:vx_index/global.dart';
import 'package:vx_index/screens/drawer/new_email.dart';
import 'package:vx_index/screens/drawer/new_password.dart';
import 'package:vx_index/services/utils.dart';

import '../../businesses/businessDialogViewScreen.dart';
import '../../users/userModel.dart';
import '../drawer/preferences.dart';
import '../drawer/settings.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, required this.user});
  final User user;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  BusinessesAPI businessesAPI = BusinessesAPI();
  fetchBusinessByUserId() {
    businessesAPI.get(widget.user.businessId).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return BusinessDialogView(index: 1, data: value.data!);
          },
        ),
      );
    });
  }

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
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(widget.user.imageUrl),
            radius: 50.4,
          ),
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
          leading: const Icon(Icons.contact_mail),
          title: const Text('Account'),
          onTap: () {
            fetchBusinessByUserId();
          },
        ),
        ListTile(
          leading: const Icon(Icons.message),
          title: const Text('Notifications'),
          onTap: () {
            Navigator.of(context).pushNamed("/messages");
          },
        ),
        ListTile(
          leading: const Icon(Icons.account_balance_wallet_rounded),
          title: const Text('Billings'),
          onTap: () {
            Navigator.of(context).pushNamed("/messages");
          },
        ),
        ListTile(
          leading: const Icon(Icons.favorite_outline_rounded),
          title: const Text('Favorites'),
          onTap: () {
            Navigator.of(context).pushNamed("/messages");
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
            Utils.removeItemFromLocalStorage(("user"));
            Navigator.pushReplacementNamed(context, "/logout");
          },
        ),
      ],
    ));
  }
}
