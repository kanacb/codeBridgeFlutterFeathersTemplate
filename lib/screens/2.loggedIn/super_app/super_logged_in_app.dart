import 'package:flutter/cupertino.dart';
import 'package:vx_oil_futures4/screens/3.market/super_app/1.title_bar.dart';
import '../../../components/users/users.dart';
import '1.title_bar.dart';
import '2.search_bar.dart';
import '3.subscriber_bar.dart';
import '4.products_bar.dart';
import '5.commodities_bar.dart';

class SuperAnonymousApp extends StatefulWidget {
  const SuperAnonymousApp({super.key, required this.user});
  final Users user;

  @override
  State<SuperAnonymousApp> createState() => _SuperAnonymousAppState();
}

class _SuperAnonymousAppState extends State<SuperAnonymousApp> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LoggedInTitleBar(
            user: widget.user,
          ),
          const SearchLoggedInBar(),
          const SubscribeLoggedInBar(),
          const ProductsLoggedInBar(),
          const CommoditiesLoggedInBar()
        ],
      ),
    );
  }
}
