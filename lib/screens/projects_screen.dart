import 'package:flutter/material.dart';



class ProjectsScreen extends StatelessWidget {

   
   final String text;
   
   ProjectsScreen({Key? key, required this.text}) : super(key: key);
  
  
@override
  Widget build(BuildContext context) {
    final options = [text];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Proyectos'),
          centerTitle: true,
        ),
        body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                title: Text (text),
                trailing: const Icon (Icons.arrow_forward_ios_outlined, color: Colors.indigo,),
                onTap: () {
                  
                },
          ), 
          separatorBuilder: (_, __) => const Divider(), 
          itemCount: options.length
          )
        );
  }
}
