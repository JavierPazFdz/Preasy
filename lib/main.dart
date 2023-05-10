import 'package:flutter/material.dart';
import 'package:preasy/screens/screens.dart';

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
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: 'login',
      routes:{
        'login': ( _ ) => const LoginScreen(),
        'home':(_)=>const HomeScreen(),
        'settings':(_)=>const SettingScreen(),
        'new_project':(_)=>const NewProjectScreen(),

      },
      debugShowCheckedModeBanner: false,
    );
  }
}



