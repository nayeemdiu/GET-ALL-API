import 'package:flutter/material.dart';
import 'package:getapi/get_api.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
           appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
         //  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
           useMaterial3: true,
      ),
      home: GetApi(),
    );
  }
}
