import 'package:flutter/material.dart';
  import 'users.dart';
  import 'usersMain.dart';
  import '../../validators.dart';
  
  class UsersDialogCreate extends StatefulWidget {
    const UsersDialogCreate(
        {super.key, required this.index, required this.data});
    final Users data;
    final int index;

    @override
    State<UsersDialogCreate> createState() => _UsersDialogCreateState();
  }
  
  class _UsersDialogCreateState extends State<UsersDialogCreate> {
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("create Users"),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const UsersScreen();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.save),
                color: Colors.orange,
                iconSize: 20,
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
                key: widget.key,
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 60.0, bottom: 20.0, left: 20.0, right: 20.0),
                    child: Wrap(children: [
                      TextFormField(
                keyboardType: TextInputType.name,
    
                validator: (value) {
                  if (Validators.isStringNotEmpty(value, true)) {
                    return null;
                  }
                  return "Please enter a value";
                },
                onSaved: (value) {
                  widget.data.name = value!;
                },
                decoration: const InputDecoration(
                  hintText: 'name',
                  labelText: 'Name',
                ),
              ),
TextFormField(
                keyboardType: TextInputType.name,
    
                validator: (value) {
                  if (Validators.isStringNotEmpty(value, true)) {
                    return null;
                  }
                  return "Please enter a value";
                },
                onSaved: (value) {
                  widget.data.email = value!;
                },
                decoration: const InputDecoration(
                  hintText: 'email',
                  labelText: 'Email',
                ),
              ),
TextFormField(
                keyboardType: TextInputType.name,
    
                validator: (value) {
                  if (Validators.isStringNotEmpty(value, true)) {
                    return null;
                  }
                  return "Please enter a value";
                },
                onSaved: (value) {
                  widget.data?.photo = value!;
                },
                decoration: const InputDecoration(
                  hintText: 'photo',
                  labelText: 'Photo',
                ),
              ),
TextFormField(
                keyboardType: TextInputType.name,
    
                validator: (value) {
                  if (Validators.isStringNotEmpty(value, true)) {
                    return null;
                  }
                  return "Please enter a value";
                },
                onSaved: (value) {
                  widget.data?.mobile = value!;
                },
                decoration: const InputDecoration(
                  hintText: 'mobile',
                  labelText: 'Mobile',
                ),
              ),
TextFormField(
                keyboardType: TextInputType.name,
    
                validator: (value) {
                  if (Validators.isStringNotEmpty(value, true)) {
                    return null;
                  }
                  return "Please enter a value";
                },
                onSaved: (value) {
                  widget.data?.createdBy = value!;
                },
                decoration: const InputDecoration(
                  hintText: 'createdBy',
                  labelText: 'CreatedBy',
                ),
              ),
TextFormField(
                keyboardType: TextInputType.name,
    
                validator: (value) {
                  if (Validators.isStringNotEmpty(value, true)) {
                    return null;
                  }
                  return "Please enter a value";
                },
                onSaved: (value) {
                  widget.data?.businessId = value!;
                },
                decoration: const InputDecoration(
                  hintText: 'businessId',
                  labelText: 'BusinessId',
                ),
              ),
                      Expanded(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          backgroundColor: Colors.orange,
                        ),
                        onPressed: () {},
                        child: const Text("Update", style: TextStyle(color: Colors.white), ),
                      ))
                    ]))),
          ));
    }
  }