import 'package:flutter/material.dart';
import 'package:learn_flutter_clean/core/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(
        appBar: AppBar(title: Text('Posts'),),
        body: Center(
          child: Container(
            child: Text('Here wo go'),
          ),
        ),
      ),
    );
  }
}
