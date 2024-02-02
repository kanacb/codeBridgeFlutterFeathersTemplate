import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/users/users.dart';
import '../../components/users/usersService.dart';
import '../../global.dart';
import '../../validators.dart';

class ChangeEmail extends StatelessWidget {
  const ChangeEmail({super.key, required this.user});
  final Users user;
  @override
  Widget build(BuildContext context) {
    late String email = "";
    late LabeledGlobalKey<FormState> key =
        LabeledGlobalKey<FormState>("ChangeEmail");

    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: Text("Hi, ${user.name}",
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w200))),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: key,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60.0, bottom: 20.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Change Email',
                    style: TextStyle(fontSize: 50.0),
                  ),
                  Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (Validators.isEmail(value)) {
                            return null;
                          }
                          return "Please enter new email";
                        },
                        onSaved: (value) {
                          email = value!;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter your new email address',
                          labelText: 'My New Email',
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                backgroundColor: const Color(0xff447def),
                              ),
                              onPressed: () async {
                                // if (key.currentState!.validate()) {
                                //   key.currentState!.save();
                                //   UsersService usersService = UsersService();
                                //   final response = await usersService
                                //       .patch(user.id, {"email": email});
                                //   if (response.errorMessage == null) {
                                //     logger.i(response.data!.toString());
                                //     if (context.mounted) {
                                //       Navigator.pop(context);
                                //     }
                                // } else {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.blueGrey,
                                      content: Text(
                                        "Currently not available",
                                        style: TextStyle(
                                            fontSize: 21,
                                            fontWeight: FontWeight.w200),
                                      ),
                                      elevation: 2,
                                      duration: Duration(seconds: 3),
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.all(5),
                                    ),
                                  );
                                }
                                // }
                              },
                              // },
                              child: const Text(
                                'Send verification link to',
                                style: TextStyle(
                                    fontSize: 25.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(user.email),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
