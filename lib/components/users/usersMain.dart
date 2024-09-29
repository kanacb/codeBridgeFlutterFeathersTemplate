import 'package:flutter/material.dart';
    import '../../screens/widgets/loading.dart';
    import 'users.dart';
    import 'usersService.dart';

    class UsersScreen extends StatefulWidget {
      const UsersScreen({super.key});

      @override
      State<UsersScreen> createState() => _UsersScreenState();
    }

    class _UsersScreenState extends State<UsersScreen> {
      late bool isLoading;
      List<Users> data = [];
      String? error;
      UsersService users = UsersService();

      fetchData() {
        setState(() {
          isLoading = true;
        });
        UsersService().getAll().then(
          (response) {
            isLoading = false;
            if (response.errorMessage == null) {
              setState(() {
                data = response.data!;
              });
            } else {
              setState(() {
                error = response.errorMessage;
              });
            }
          },
        );
      }

      @override
      void initState() {
        isLoading = true;
        fetchData();
        super.initState();
      }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 12,
            titleSpacing: 10,
            title: const Text(
              "Users",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          body: isLoading
              ? const LoadingWidget()
              : error == null
                  ? data.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Center(
                            child: Text(
                              "Users list is empty for now",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        )
                      : ListView.separated(
                          itemCount: data.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              // leading: CircleAvatar(
                              //   backgroundImage: NetworkImage(data[index].imageUrl),
                              //   maxRadius: 24,
                              // ),
                              title: const Text(
                                "Users",
                                style: TextStyle(fontSize: 16),
                              ),
                              // subtitle: Text(
                              //   users[index].email,
                              //   style: TextStyle(
                              //     fontSize: 13,
                              //     color: Colors.grey.shade600,
                              //   ),
                              // ),
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Clicked "),
                                    elevation: 2,
                                    duration: const Duration(seconds: 3),
                                    behavior: SnackBarBehavior.floating,
                                    margin: const EdgeInsets.all(5),
                                  ),
                                );
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              indent: 16,
                              endIndent: 16,
                              height: 1,
                            );
                          },
                        )
                  : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Text(
                          error!,
                          style: const TextStyle(fontSize: 16, color: Colors.red),
                        ),
                      ),
                    ),
        );
      }
    }