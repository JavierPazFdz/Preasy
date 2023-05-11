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
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: 'checking',
      routes:{
        'checking':(_)=>const CheckAuthScreen(),
        'home':(_)=> HomeScreen(),
        'login': ( _ ) => const LoginScreen(),
        'new_project':(_)=>const NewProjectScreen(),
        'register':(_)=>const RegisterScreen(),
        'settings':(_)=>const SettingScreen(),


      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      debugShowCheckedModeBanner: false,
    );
  }
}



