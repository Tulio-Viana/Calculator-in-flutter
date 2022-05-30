import 'package:flutter/material.dart';
import '../modules/main/pages/index.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prova PDM - Túlio',
      home: HomePage(),
    );
  }
}
