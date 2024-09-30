import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../screens/favourites/favourite_products.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Faves", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),),
      ),
      body: const FavoriteProducts(),
    );
  }


}
