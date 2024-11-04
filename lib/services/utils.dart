import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:moment_dart/moment_dart.dart';
import '../screens/2.loggedIn/welcome_screen.dart';
import '../screens/2.loggedIn/logged_in_screen.dart';
import './projectServices.dart';
import '../components/businesses/businesses.dart';
import '../components/users/users.dart';
import '../screens/3.market/market_screen.dart';
import '../screens/admin/admin_screen.dart';

class Utils {
  static final LocalStorage storage = LocalStorage('cb_app');

  static void removeAllFromLocalStorage() {
    storage.clear();
  }

  static void addItemsToLocalStorage(String key, Map<String, dynamic> data) {
    storage.setItem(key, data);
  }

  static Map<String, dynamic>? getItemFromLocalStorage(String key) {
    var item = storage.getItem(key);
    if (item != null) {
      Map<String, dynamic> item = storage.getItem(key);
      return item;
    }
    return null;
  }

  static void removeItemFromLocalStorage(String key) {
    storage.deleteItem(key);
  }

  static String isAfternoon() {
    final theHour = Moment.now().hour;
    if (theHour > 12) {
      return "afternoon";
    } else if (theHour < 12)
      return "morning";
    else
      return "evening";
  }

  static Map<String, dynamic> getFromLocalStorage() {
    Users? user;
    Businesses? business;
    var thisUser = Utils.getItemFromLocalStorage("user");
    var thisBiz = Utils.getItemFromLocalStorage("business");

    if (thisUser != null) {
      user = Users.fromMap(thisUser);
    }

    if (thisBiz != null) {
      business = Businesses.fromMap(thisBiz);
    }
    if (kDebugMode) {
      print(thisUser.toString());
      print(thisBiz.toString());
    }
    return {"user": user, "business": business};
  }

  static Map<String, dynamic> getUserFromLocalStorage() {
    Users? user;
    var thisUser = Utils.getItemFromLocalStorage("user");
    if (thisUser != null) {
      user = Users.fromMap(thisUser);
    }    else {
      return { "business" : null };
    }
    return {"user": user};
  }

  static Map<String, dynamic> getBusinessFromLocalStorage() {
    Businesses? business;
    var thisBiz = Utils.getItemFromLocalStorage("business");
    if (thisBiz != null) {
      business = Businesses.fromMap(thisBiz);
    }
    else {
      return { "business" : null };
    }
    return { "business" : business };
  }

  static Map<String, dynamic> getSubscriptionFromLocalStorage() {
    Users? user;
    Businesses? business;
    var thisUser = Utils.getItemFromLocalStorage("user");
    var thisBiz = Utils.getItemFromLocalStorage("business");

    if (thisUser != null) {
      user = Users.fromMap(thisUser);
    }

    if (thisBiz != null) {
      business = Businesses.fromMap(thisBiz);
    }    else {
      return { "business" : null };
    }
    return {"user": user, "business": business};
  }

  static Map<String, dynamic> getUserState(String userState) {
    return userStates
        .firstWhere((element) => element['userState'] == userState);
  }

  static Future<void> redirectUser(BuildContext context) async {
    Map<String, dynamic> local = Utils.getFromLocalStorage();
    Users? user = local['user'];
    Businesses? business = local['business'];

    if (context.mounted) {
      if (business?.businessType == "Owner") {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AdminScreen(user: user!);
            },
          ),ModalRoute.withName('/AdminScreen'),
        );
      } else if (business != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MarketScreen(
                user: user!,
                business: business!,
              );
            },
          ),ModalRoute.withName('/MarketScreen'),
        );
      } else if (user != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LoggedInScreen(
                user: user,
              );
            },
          ),
          ModalRoute.withName('/LoggedInScreen'),
        );
      } else {
         Navigator.of(context).pushNamed("/login");
      }
    }
  }

  static redirectUserOnBuyer(BuildContext context) {
    Users? user = Utils.getUserFromLocalStorage()["user"];
    Businesses? business = Utils.getBusinessFromLocalStorage()["business"];

    if (context.mounted) {
      if (business != null) {
        Navigator.of(context).pushNamed("/quotation/create");
      } else if (user != null) {
        Navigator.of(context).pushNamed("/business/create");
      } else {
        Navigator.of(context).pushNamed("/login");
      }
    }
  }
}
