import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vx_oil_futures4/components/businesses/businessesService.dart';

import '../../components/businesses/businesses.dart';

class AppBarTitle extends StatefulWidget {
  const AppBarTitle({super.key});

  @override
  State<AppBarTitle> createState() => _AppBarTitleState();
}

class _AppBarTitleState extends State<AppBarTitle> {
  final TextEditingController _searchController = TextEditingController();
  late bool _isLoading;
  List<Businesses> _businesses = [];
  List<Businesses> _filteredbusinesses = [];
  String? error;
  BusinessesService businessesService = BusinessesService();

  fetchBusinesses() {
    businessesService.getAll().then(
      (response) {
        _isLoading = false;
        if (response.errorMessage == null) {
          setState(() {
            _businesses = response.data!;
            _filteredbusinesses = response.data!;
            _isLoading = false;
          });
        } else {
          setState(() {
            error = response.errorMessage;
            _isLoading = false;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    fetchBusinesses();
    _searchController.addListener(_performSearch);
  }

  Future<void> _performSearch() async {
    setState(() {
      _isLoading = true;
    });

    //Simulates waiting for an API call
    await Future.delayed(const Duration(milliseconds: 1000));

    setState(() {
      _filteredbusinesses = _businesses
          .where((element) => element.name
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: const InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(color: Colors.white54),
          border: InputBorder.none,
          fillColor: Colors.cyanAccent),
      onChanged: (value) {
        // Perform search functionality here
      },
    );
  }
}
