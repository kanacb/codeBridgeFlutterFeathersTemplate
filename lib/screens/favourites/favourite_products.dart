import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moment_dart/moment_dart.dart';

import '../../components/request4quote/request4quote.dart';
import '../../components/request4quote/request4quoteService.dart';

class FavoriteProducts extends StatefulWidget {
  const FavoriteProducts({super.key});

  @override
  State<FavoriteProducts> createState() => _FavoriteProductsState();
}

class _FavoriteProductsState extends State<FavoriteProducts> {
  String? error;
  List<Request4quote> request4quote = [];
  Request4quoteService request4quoteService = Request4quoteService();
  List<dynamic> rfqObj = [];

  @override
  void initState() {
    super.initState();
  }

  Future fetchRequest4quote() async {
    var response = await request4quoteService.getAll();
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if ((projectSnap.connectionState == ConnectionState.none &&
            !projectSnap.hasData)) {
          return const Text("No data");
        }
        if (projectSnap.data == null) {
          return const Text("No Connection");
        }
        return SizedBox(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: projectSnap.data.data.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return tile(projectSnap.data.data[index]);
                }));
      },
      future: fetchRequest4quote(),
    );
  }

  Widget tile(Request4quote rfq) {
    DateTime tempDate = DateTime.parse(rfq.expiration);
    final expiration = Moment(tempDate, localization: LocalizationEnUs());
    tempDate = DateTime.parse(rfq.delivery);
    final delivery = Moment(tempDate, localization: LocalizationEnUs());
    return ListTile(
      leading: const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/fav.jpg'),
        ),
      ),
      title: Wrap(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Text(
              "Buyer: ${rfq.businessId.name} ",
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      trailing: SizedBox(
          width: 50,
          child: Text("Exp: ${expiration.fromNow()} ",
              style: const TextStyle(
                color: Colors.black,
              ))),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 8, top: 4),
        child: Text('Delivery ${delivery.fromNow()}',
            style: const TextStyle(fontSize: 10)),
      ),
    );
  }
}
