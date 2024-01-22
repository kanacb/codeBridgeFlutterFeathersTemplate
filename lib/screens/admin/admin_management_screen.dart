import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/users/users.dart';
import '../../global.dart';
import '../../services/projectServices.dart';

class AdminManagementScreen extends StatefulWidget {
  const AdminManagementScreen({super.key, required this.user});
  final Users user;

  @override
  State<AdminManagementScreen> createState() => _AdminManagementScreenState();
}

class _AdminManagementScreenState extends State<AdminManagementScreen> {

  @override
  Widget build(BuildContext context) {
    return
       ListView.builder(
        itemCount: services.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return card(context, services[index], index);
        },
    );
  }

  Widget card( BuildContext context, Map<String, dynamic> service, int index) {
    return Card(
      color: Colors.yellow[50],
      elevation: 8.0,
      margin: const EdgeInsets.all(4.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
              images[images.length%4],
              height: MediaQuery.of(context).size.width * (3 / 4),
              width: MediaQuery.of(context).size.width,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return service['screen'];
                  },
                ),
              );
            },
            child: Text(
              service['name'],
              style: const TextStyle(
                fontSize: 38.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
