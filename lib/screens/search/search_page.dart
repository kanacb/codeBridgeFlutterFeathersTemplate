import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/search/recent_activities.dart';
import '../screens/search/recommended_products.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> myCoolStrings = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Some other item'
  ];

  final List<String> _results = [];

  void _handleSearch(String input) {
    _results.clear();
    for (var str in myCoolStrings) {
      if (str.toLowerCase().contains(input.toLowerCase())) {
        setState(() {
          _results.add(str);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 45,
            width: 360,
            child: TextField(
              onChanged: _handleSearch,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xfff1f1f1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search for Items",
                hintStyle: const TextStyle(
                    color: Color(0xffb2b2b2),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                    decorationThickness: 6),
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: _results.isEmpty
                ? ListView.builder(
                    itemCount: myCoolStrings.length,
                    itemBuilder: (context, index) {
                      final data = myCoolStrings[index];
                      return ListTile(
                          leading: const Icon(Icons.list),
                          trailing: const Text(
                            "GFG",
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          ),
                          title: Text(data));
                    })
                : ListView.builder(
                    itemCount: _results.length,
                    itemBuilder: (context, index) {
                      final data = _results[index];
                      return ListTile(
                          leading: const Icon(Icons.list),
                          trailing: const Text(
                            "GFG",
                            style: TextStyle(color: Colors.green, fontSize: 15),
                          ),
                          title: Text(data));
                    }),
          ),
          const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              width: 10,
            ),
            Text("Recent Activities", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.arrow_circle_right)
          ]),
          const RecentActivities(),
        ],
      ),
    );
  }
}
