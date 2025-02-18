import 'package:flutter/material.dart';
import 'screens/form_screen1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi-Form Validation',
      home: FormScreen1(),
    );
  }
}
