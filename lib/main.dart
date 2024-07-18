import  'package:flutter/material.dart';
import 'package:projek_akhir/login_screen.dart';
import 'package:projek_akhir/pages/main_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: HalamanMain(),
    theme: ThemeData(primarySwatch: Colors.pink),
    debugShowCheckedModeBanner: false,
    );
  }
}