import 'package:asistente/index.dart';

import 'login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends IndexScreen {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asistente Virtual de Salud- Sabi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}