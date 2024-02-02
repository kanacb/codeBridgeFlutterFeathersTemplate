import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/request4quote/request4quoteCards.dart';
import '../../../services/utils.dart';

class ProductsLoggedInBar extends StatefulWidget {
  const ProductsLoggedInBar({super.key});

  @override
  State<ProductsLoggedInBar> createState() => _ProductsLoggedInBarState();
}

class _ProductsLoggedInBarState extends State<ProductsLoggedInBar> {
  @override
  Widget build(BuildContext context) {

      return Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(width: 10,),
            const Text(
              "Bid now",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
            ),
            IconButton(
                onPressed: () => Utils.redirectUserOnBuyer(context),
                icon: const Icon(
                  Icons.arrow_circle_right,
                  size: 20,
                ))
          ],
        ),
        const Request4quoteCards()
      ]);

  }
}
