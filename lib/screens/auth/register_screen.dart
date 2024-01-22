import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../global.dart';
import '../../services/authService.dart';
import '../../validators.dart';
import '../widgets/footer.dart';
import '../widgets/loading.dart';
import 'login_screen.dart';


class RegisterScreen extends StatefulWidget {
   const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String email;
  late String password;
  late String name;

  bool shouldValidate = true;
  bool isRegistering = false;
  late LabeledGlobalKey<FormState> key =
      LabeledGlobalKey<FormState>("RegistrationForm");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            autovalidateMode: shouldValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            key: key,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60.0, bottom: 20.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 50.0),
                  ),
                  Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (Validators.isStringNotEmpty(value, true)) {
                            return null;
                          }
                          return "Please enter a value";
                        },
                        onSaved: (value) {
                          name = value!;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          labelText: 'Name',
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (Validators.isEmail(value)) {
                            return null;
                          }
                          return "Please enter a valid email";
                        },
                        onSaved: (value) {
                          email = value!;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email',
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (Validators.isPassword(value)) {
                            return null;
                          }
                          return "Please enter a strong password";
                        },
                        onSaved: (value) {
                          password = value!;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
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
                                if (key.currentState!.validate()) {
                                  key.currentState!.save();
                                  setState(() {
                                    isRegistering = true;
                                  });
                                  AuthAPI auth = AuthAPI();
                                  final response = await auth.registerUser(
                                      name, email, password);
                                  setState(() {
                                    isRegistering = false;
                                  });
                                  if (response.errorMessage == null) {
                                    logger.i(response.data!.toString());
                                    if (context.mounted) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return  const LoginScreen();
                                          },
                                        ),
                                      );
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
                              child: isRegistering
                                  ? const MiniCPI()
                                  : const Text(
                                      'Register',
                                      style: TextStyle(
                                          fontSize: 25.0, color: Colors.white),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 140,),
                      const Text(
                        'Already have an account?',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const LoginScreen();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          ' Login',
                          style: TextStyle(fontSize: 16.0, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  const FooterWidget()
                ],
              ),
            ),
          ),
        ));
  }
}

