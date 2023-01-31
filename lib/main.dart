/*
-----Code By Group 8-----
Name:MUHAMMAD AFIQ BIN ALUSRIZAN
Name :MUHAMMAD SYABIL  BIN ABU BAKAR
Name :MUHAMMAD AMIRUL BIN AZHAR 
*/
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home: Register(),
    );
  }
}
