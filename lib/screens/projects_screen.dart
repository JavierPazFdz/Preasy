import 'package:flutter/material.dart';

class ProjectsScreen extends StatelessWidget {
  //final String text;
  final String name;
  final String description;
  final String end;
  final String start;

  ProjectsScreen(
      {Key? key,
      required this.name,
      required this.description,
      required this.end,
      required this.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final options = [name + description + start + end];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Proyectos'),
          centerTitle: true,
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                
                title: Text(name),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.indigo,
                ),
                onTap: () {
                  showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) {
                        return Center(
                          child: AlertDialog(
                            backgroundColor: Colors.deepPurple[50],
                            elevation: 5,
                            title: Text(name),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(300),
                                  child: Image.asset('lib/assets/logo_preasy.jpg', height: 75, width: 75,fit: BoxFit.cover,),
                                ),
                                SizedBox(height: 20,),

                                Text(
                                    'Descripción del proyecto:\n\n$description\n\nFecha de inicio: $start\nFecha de finalizacion: $end'),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                            actions: [ 
                              TextButton(
                                  onPressed: () {},
                                  child: const Text('Ir al proyecto')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Volver'))
                            ],
                          ),
                        );
                      });
                }),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: options.length));
  }
}
