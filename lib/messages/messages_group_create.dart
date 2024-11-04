import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'messages_api.dart';

import '../services/utils.dart';
import '../validators.dart';

class GroupCreateScreen extends StatefulWidget {
  const GroupCreateScreen({super.key});

  @override
  State<GroupCreateScreen> createState() => _GroupCreateScreenState();
}

class _GroupCreateScreenState extends State<GroupCreateScreen> {
  late String name;
  late String topic;
  String image = "";
  late LabeledGlobalKey<FormState> key =
      LabeledGlobalKey<FormState>("CreateGroupForm");

  bool shouldValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Notifications"),
        ),
        body: Form(
          autovalidateMode: shouldValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          key: key,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 60.0, bottom: 0.0, left: 20.0, right: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Create a chat group',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (Validators.isStringNotEmpty(value)) {
                            return null;
                          }
                          return "Please enter valid name";
                        },
                        onSaved: (value) {
                          name = value!;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          labelText: 'Name',
                        ),
                      ),
                      TextFormField(
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (Validators.isStringNotEmpty(value)) {
                            return null;
                          }
                          return "Please enter a topic";
                        },
                        onSaved: (value) {
                          topic = value!;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Topic',
                          labelText: 'Topic',
                        ),
                      ),
                      TextFormField(
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (Validators.isStringNotEmpty(value)) {
                            return null;
                          }
                          return "Please enter a valid url";
                        },
                        onSaved: (value) {
                          topic = value!;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Image url',
                          labelText: 'Image',
                        ),
                      ),
                      const SizedBox(height: 50.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              autofocus: true,
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                backgroundColor: const Color(0xff447def),
                              ),
                              onPressed: () async {
                                setState(() {
                                  shouldValidate = true;
                                });
                                if (key.currentState!.validate()) {
                                  key.currentState!.save();

                                  GroupsAPI groupsAPI = GroupsAPI();
                                  final response = await groupsAPI.createGroup(
                                      name, topic, image);
                                  if (response.errorMessage == null) {
                                    if (context.mounted) {
                                      return Utils.redirectUser(context);
                                    }
                                  } else {
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(response.errorMessage!),
                                          elevation: 2,
                                          duration: const Duration(seconds: 3),
                                          behavior: SnackBarBehavior.floating,
                                          margin: const EdgeInsets.all(5),
                                        ),
                                      );
                                    }
                                  }
                                }
                              },
                              child: const Text(
                                'Create',
                                style: TextStyle(
                                    fontSize: 25.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
