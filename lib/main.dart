import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/home_screen_old.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/check_member_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ERCI App',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      debugShowCheckedModeBanner: false,
      home: HomeScreenOld(),
      routes: {
        '/login': (_) => LoginScreen(),
        '/register': (_) => RegisterScreen(),
        '/check': (_) => CheckMemberScreen(),
      },
    );
  }
}