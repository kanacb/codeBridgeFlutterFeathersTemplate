import 'package:flutter/cupertino.dart';
import 'package:vx_oil_futures4/screens/anonymous/super_app/5.commodities_bar.dart';
import '1.title_bar.dart';
import '2.search_bar.dart';
import '3.subscriber_bar.dart';
import '4.products_bar.dart';

class SuperAnonymousApp extends StatefulWidget {
  const SuperAnonymousApp({super.key});

  @override
  State<SuperAnonymousApp> createState() => _SuperAnonymousAppState();
}

class _SuperAnonymousAppState extends State<SuperAnonymousApp> {
  @override
  Widget build(BuildContext context) {
    return   const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnonymousTitleBar(),
          SearchAnonymousBar(),
          SubscribeAnonymousBar(),
          ProductsAnonymousBar(),
          CommoditiesAnonymousBar()
        ],
      ),
    );
  }
}
