import 'package:flutter/cupertino.dart';
import '../../../screens/market/super_app/5.subscribe_bar.dart';
import '../../../components/businesses/businesses.dart';
import '../../../components/request4quote/request4quoteCards.dart';
import '../../../components/users/users.dart';
import '1.title_bar.dart';
import '2.search_bar.dart';
import '3.services_bar.dart';
import '4.points_bar.dart';
import '6.orders_bar.dart';
import '7.recommended_bar.dart';
import '8.offers_bar.dart';


class SuperApp extends StatefulWidget {
  const SuperApp({super.key, required this.user, required this.business});
  final Users user;
  final Businesses business;
  // final Subscription subscription;

  @override
  State<SuperApp> createState() => _SuperAppState();
}

class _SuperAppState extends State<SuperApp> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TitleBar(user: widget.user),
          SearchBar(user: widget.user),
          ServicesBar(user: widget.user),
          PointBar(user: widget.user),
          const SubscribeBar(),
          OrdersBar(user: widget.user),
          RecommendedBar(user: widget.user),
          OffersBar(user: widget.user)
        ],
      ),
    );
  }
}
