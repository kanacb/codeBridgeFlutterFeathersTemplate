import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moment_dart/moment_dart.dart';

import '../../components/request4quote/request4quote.dart';
import '../../components/request4quote/request4quoteService.dart';

class RecommendedProducts extends StatefulWidget {
  const RecommendedProducts({super.key});

  @override
  State<RecommendedProducts> createState() => _RecommendedProductsState();
}

class _RecommendedProductsState extends State<RecommendedProducts> {
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
            !projectSnap.hasData) ) {
          return const Text("No data");
        }
        if(projectSnap.data.data == null) {
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
                  return card(projectSnap.data.data[index]);
                }));
      },
      future: fetchRequest4quote(),
    );
  }

  Widget card(Request4quote rfq) {
    DateTime tempDate = DateTime.parse(rfq.expiration);
    final expiration = Moment(tempDate, localization: LocalizationEnUs());
    tempDate = DateTime.parse(rfq.delivery);
    final delivery = Moment(tempDate, localization: LocalizationEnUs());

    return Card(
      color: Colors.black,
      elevation: 8.0,
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(20),
          height: 150,
          width: 230,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      rfq.createdBy.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      rfq.commodityId.name!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Qty",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(rfq.quantity.toString(),
                        style: const TextStyle(color: Colors.white)),
                    const Text("/ltr",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: onQuote,
                      child: const Text("quote",
                          style:
                          TextStyle(color: Colors.black87, fontSize: 12)),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      rfq.businessId.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Exp:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Text(
                        "${expiration.fromNow()} ",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Delivery:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      Text(
                        "${delivery.fromNow()} ",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ]),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Payment Terms: ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Text(
                      '3 days',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )
                  ],
                ),
              ])),
    );
  }

  onQuote() {}
}
