import 'package:anketapp/Pages/Auth/LoginPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppStarter(),
    )
  );
}

class AppStarter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}