import 'package:flutter/material.dart';
import 'package:preasy_javipaz/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preasy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeScreen.routerName,
      routes:{
        HomeScreen.routerName:(_)=>const HomeScreen(),
        SettingScreen.routerName:(_)=>const SettingScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}



