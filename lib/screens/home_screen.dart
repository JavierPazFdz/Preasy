import 'package:flutter/material.dart';
import 'package:preasy/services/services.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatelessWidget {

  static const String routerName='Home';

  HomeScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final authservice = Provider.of<AuthService>(context, listen:false);

    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Home'),
        actions:<Widget> [IconButton(onPressed: () {
          Navigator.pushReplacementNamed(context, 'new_project');
        }, icon: Icon(Icons.add),)],
        leading: 
        IconButton(
          icon: Icon(Icons.menu_book),
          onPressed: (){},),
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.logout),
          onPressed: (){
              authservice.logout();
              Navigator.pushReplacementNamed(context, 'login');
          } ),

        ]
        
        
      ),
        body: const Center(
          child: Text('HomeScreen'),
        )

    );
  
}}