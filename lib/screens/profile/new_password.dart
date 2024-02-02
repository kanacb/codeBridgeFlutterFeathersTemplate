import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/users/usersService.dart';
import '../../components/users/users.dart';
import '../../global.dart';
import '../../validators.dart';
import '../widgets/loading.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key, required this.user});
  final Users user;
  @override
  State<ChangePassword> createState() => _ChangePasswordState();

}

class _ChangePasswordState extends State<ChangePassword> {
  late String old = "";
  late String newPassword = "";
  late String confirm = "";
  bool isChanging = false;
  late LabeledGlobalKey<FormState> key =
  LabeledGlobalKey<FormState>("ChangePassword");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text(widget.user.name)),
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
                    'Change Password',
                    style: TextStyle(fontSize: 50.0),
                  ),
                  Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (Validators.isStringNotEmpty(value, false)) {
                            return null;
                          }
                          return "Please enter old password";
                        },
                        onSaved: (value) {
                          old = value!;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Old Password',
                          labelText: 'Old Password',
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if(old.isNotEmpty && old != value){
                            return "Please select a new password";
                          }
                          if (Validators.isPassword(value)) {
                            return null;
                          }
                          return "Please enter a strong password";
                        },
                        onSaved: (value) {
                          newPassword = value!;
                        },
                        decoration: const InputDecoration(
                          hintText: 'New Password',
                          labelText: 'New Password',
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if(newPassword != value){
                            return "Please check your password";
                          }
                          if (Validators.isPassword(value)) {
                            return null;
                          }
                          return "Please enter a strong password";
                        },
                        onSaved: (value) {
                          confirm = value!;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Confirm Password',
                          labelText: 'Confirm Password',
                        ),
                      ),
                      const SizedBox(height: 30.0),
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
                                //   setState(() {
                                //     isChanging = true;
                                //   });
                                //   UsersService usersService = UsersService();
                                //   final response = await usersService.patch(widget.user.id , { "password" : newPassword});
                                //   setState(() {
                                //     isChanging = false;
                                //   });
                                //   if (response.errorMessage == null) {
                                //     logger.i(response.data!.toString());
                                //     if (context.mounted) {
                                //       Navigator.pop(context);
                                //     }
                                //   } else {
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(

                                        const SnackBar(
                                          backgroundColor: Colors.blueGrey,
                                          content: Text("Currently unavailable", style: TextStyle(fontWeight: FontWeight.w200, fontSize: 14),),
                                          elevation: 2,
                                          duration: Duration(seconds: 3),
                                          behavior: SnackBarBehavior.floating,
                                          margin: EdgeInsets.all(5),
                                        ),
                                      );
                                    }
                                  // }
                                // }
                              },
                              child: isChanging
                                  ? const MiniCPI()
                                  : const Text(
                                'Change',
                                style: TextStyle(
                                    fontSize: 25.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

}

