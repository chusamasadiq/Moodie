import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moodie/screens/home_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moodie',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(112, 29, 83, 1),
          primarySwatch: Colors.deepPurple,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(112, 29, 83, 1),
          )),
      home: const Homepage(),
    );
  }
}
