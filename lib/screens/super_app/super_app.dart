import 'package:flutter/cupertino.dart';
import 'package:vx_oil_futures4/screens/super_app/1.title_bar.dart';
import 'package:vx_oil_futures4/screens/super_app/2.search_bar.dart';
import 'package:vx_oil_futures4/screens/super_app/4.orders_bar.dart';
import 'package:vx_oil_futures4/screens/super_app/5.recommended_bar.dart';
import 'package:vx_oil_futures4/screens/super_app/6.offers_bar.dart';

import '3.points_bar.dart';

class SuperApp extends StatefulWidget {
  const SuperApp({super.key});

  @override
  State<SuperApp> createState() => _SuperAppState();
}

class _SuperAppState extends State<SuperApp> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          TitleBar(),
          SearchBar(),
          PointBar(),
          OrdersBar(),
          RecommendedBar(),
          OffersBar()
        ],
      ),
    );
  }
}
