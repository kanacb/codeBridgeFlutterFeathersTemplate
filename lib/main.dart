import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import './screens/anonymous/anonymous_screen.dart';
import './screens/anonymous/welcome_screen.dart';
import './screens/auth/login_screen.dart';
import './messages/messages_screen.dart';
import './services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feathersjs/flutter_feathersjs.dart';
import 'package:google_fonts/google_fonts.dart';
import './services/utils.dart';
import './components/users/users.dart';
// import 'package:socket_io_client/socket_io_client.dart' as socket;

FlutterFeathersjs flutterFeathersJS = FlutterFeathersjs()
  ..init(baseUrl: API.baseUrl, extraHeaders: {"auth": API.secret});
 main() {
  WidgetsFlutterBinding.ensureInitialized();
  Dio dio =
      Dio(BaseOptions(baseUrl: API.baseUrl, headers: {"auth": API.secret}));
  flutterFeathersJS.configure(FlutterFeathersjs.restClient(dio));

  // socket.Socket io = socket.io(API.baseUrl);
  // flutterFeathersJS.configure(FlutterFeathersjs.socketioClient(io));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget  {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 Users? user;

  @override
  void initState() {
    super.initState();
    var thisUser = Utils.getItemFromLocalStorage("user");
    if (thisUser != null) {
      user = Users.fromMap(thisUser!);
      if (kDebugMode) {
        print(thisUser.toString());
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'vx_oil_futures4',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.orange,
        fontFamily: "Inter",
        scaffoldBackgroundColor: const Color(0xffF5F5F3),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          // ···
          titleLarge: const TextStyle(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: const TextStyle(
            fontSize: 30,
            fontStyle: FontStyle.normal,
          ),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      home: user?.id != null ? WelcomeScreen(user: user!) : const LandingScreen(),
      routes: {
        '/logout' : (context) => const LoginScreen(),
        '/messages' : (context) => const MessagesScreen(),
        '/settings' : (context) => const MessagesScreen()
      },
    );
  }
}
