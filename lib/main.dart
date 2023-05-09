import 'package:flutter/material.dart';
import 'package:preasy/screens/screens.dart';
import 'package:preasy/services/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => AuthService() )
      ],
      child: MyApp(),
    );
  }
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
      initialRoute: 'login',
      routes:{
        'login': ( _ ) => const LoginScreen(),
        'home':(_)=>const HomeScreen(),
        'register':(_)=>const RegisterScreen(),
        'settings':(_)=>const SettingScreen(),
        'new_project':(_)=>const NewProjectScreen(),

      },
      debugShowCheckedModeBanner: false,
    );
  }
}



