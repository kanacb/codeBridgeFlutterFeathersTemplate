import 'package:flutter/cupertino.dart';
    import 'package:flutter/material.dart';
    import 'users.dart';
    import 'usersService.dart';
    
    class UsersCards extends StatefulWidget {
      const UsersCards({super.key});
      @override
      State<UsersCards> createState() => _UsersCardState();
    }
    
    class _UsersCardState extends State<UsersCards> {
      String? error;
      late bool _isLoading;
      List<Users> users = [];
      UsersService usersService = UsersService();
    
      fetchUsers() {
        usersService.getAll().then(
          (response) {
            _isLoading = false;
            if (response.errorMessage == null) {
              setState(() {
                users = response.data!;
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
        fetchUsers();
      }
    
      @override
      Widget build(BuildContext context) {
        return SizedBox(
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return card(
                    users[index], context);
              }),
        );
      }
    
      Widget card(Users users, BuildContext context) {
        return Card(
          color: Colors.white,
          elevation: 8.0,
          margin: const EdgeInsets.all(4.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Text(users.name, style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12),),
              // Padding(
              //   padding: const EdgeInsets.all(6.0),
              //   child: Image.network(
              //     users.image,
              //     height: MediaQuery.of(context).size.width * (3 / 4) / 3,
              //     fit: BoxFit.fill,
              //   ),
              // ),
              //Text(users.description, const style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12),),
            ],
          ),
        );
      }
    }