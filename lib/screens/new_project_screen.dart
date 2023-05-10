import 'package:flutter/material.dart';
import 'package:preasy/screens/projects_screen.dart';

import '../Widgets/widgets.dart';

class NewProjectScreen extends StatelessWidget {
  const NewProjectScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String datos;
    TextEditingController _nameController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();
    TextEditingController _startController = TextEditingController();
    TextEditingController _endController = TextEditingController();
    return Scaffold(
        body: Background(
            child: SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          TextFieldContainer(
              child: Column(
            children: [
              const SizedBox(
                height: 1,
              ),
              Text(
                'Nuevo Proyecto',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(children: [
                  TextFormField(
                    controller: _nameController,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: 'Nombre del proyecto',
                      labelStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.description_outlined,
                          color: Colors.deepPurple),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                    ),
                    validator: (value) {
                      if (value != null && value.length >= 6) return null;
                      return 'El nombre debe ser de al menos 6 caracteres';
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: 'Descripción del proyecto',
                      labelStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.abc, color: Colors.deepPurple),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                    ),
                    validator: (value) {
                      if (value != null && value.length >= 6) return null;
                      return 'La descripción debe tener al menos 10 caracteres';
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _startController,
                    keyboardType: TextInputType.datetime,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: 'Fecha de inicio del proyecto',
                      labelStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.date_range_outlined,
                          color: Colors.deepPurple),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                    ),
                    validator: (value) {
                      if (value != null && value.length >= 10) return null;
                      return 'Formato Incorrecto. Ej: dd/mm/aaaa';
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _endController,
                    keyboardType: TextInputType.datetime,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: 'Fecha de finalizacion prevista',
                      labelStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.date_range_outlined,
                          color: Colors.deepPurple),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                    ),
                    validator: (value) {
                      return (value != null && value.length >= 10)
                          ? null
                          : 'Formato Incorrecto. Ej: dd/mm/aaaa';
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    disabledColor: Colors.grey,
                    elevation: 0,
                    color: Colors.deepPurple,
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        child: Text(
                          'Guardar Proyecto',
                          style: TextStyle(color: Colors.white),
                        )),
                    onPressed: () {
                      //datos = '$_nameController.text - $_descriptionController.text - $_startController.text - $_endController.text';
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProjectsScreen(
                                text: 'Nombre del Proyecto: '+_nameController.text +  "\n" +'Descripción del proyecto: '+_descriptionController.text +"\n" +'Fecha de inicio del proyecto: '+_startController.text + "\n" +'Fecha de finalización prevista: '+ _endController.text,
                                  )));

                      print(_nameController.text);

                      
                    },
                  )
                ]),
              )
            ],
          )),
        ],
      ),
    )));
  }
}
