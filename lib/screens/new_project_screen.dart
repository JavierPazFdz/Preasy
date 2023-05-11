import 'package:flutter/material.dart';
import 'package:preasy/screens/projects_screen.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

import '../Widgets/widgets.dart';

class NewProjectScreen extends StatelessWidget {
  const NewProjectScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController startController = TextEditingController();
    TextEditingController endController = TextEditingController();
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
              const SizedBox(
                height: 20,
              ),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(children: [
                  TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: nameController,
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
                    controller: descriptionController,
                    textCapitalization: TextCapitalization.sentences,
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
                    controller: startController,
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
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        startController.text =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                            
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: endController,
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
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        endController.text =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                      }
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
                                    name: nameController.text,
                                    description: descriptionController.text,
                                    start: startController.text,
                                    end: endController.text,
                                    
                                  )
                                  
                                  )
                                  
                                  );
                     
                      
                      print(nameController.text);
                    },

                      
                  ),
                     
                  const SizedBox(
                    height: 30,
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
                          'Volver',
                          style: TextStyle(color: Colors.white),
                        )),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'home');
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